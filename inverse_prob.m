function ySp = inverse_prob(img,kernel,p)

n = length(img);
x = [0:n/2-1, -n/2:-1];
[Y,X] = meshgrid(x,x);

% Creation of the Gaussian kernel
switch kernel
    case 1 % Gaussian kernel
        sigma = p; % Width
        h = exp(-(X.^2+Y.^2)/(2*sigma^2));
    case 2 % Circular kernel
        r = p;
        if (X.^2+Y.^2) <= r
            h = 1;
        else
            h = 0;
        end
end

h = h/sum(h(:));
hF = real(fft2(h)); % Fourier transform of the kernel

% Creation of the filter H
H = @(x)real(ifft2(fft2(x).*hF));


% Soft Thresholding
Jmin = 1;
options.filter = '7-9';
options.ti = 0;
%tau = 1.5; % Gradient descent step size
lambda = 0.03; % Regularization strength
niter = 100;
ySp = img; % Initiation
tau = 1.5/max(max(abs(fft2(h))))^2
energy = [];

for i=1:niter
    ySp = ySp + tau*H(img - H(ySp)); % Gradient descent
    fSpW = perform_wavelet_transf(ySp,Jmin,+1,options); % Forward transform
    fSpT = perform_thresholding(fSpW,lambda*tau,'soft'); % Thresholding
    ySp = perform_wavelet_transf(fSpT,Jmin,-1,options); % Forward transform
    energy(end+1) = 1/2*norm(img-H(ySp),'fro')^2+lambda*sum(abs(fSpW(:)));
end

% figure(1)
% h = plot(energy); axis([1,niter,min(energy)*1.05+max(energy)*(-.05) max(energy)]);
% set_label('Iteration', 'E');
% set(h, 'LineWidth', 2);

end