function compile_matconvnet(target_hardware)

if nargin < 1
    target_hardware     =   'cpu';
end

addpath matlab;

if      strcmp(target_hardware, 'cpu')
    % compile with CPU only        
    vl_compilenn(   'enableGpu',    false,      ...
                    'enableCudnn',  false,      ...
                    'mexDirName',   'mex_cpu',  ...
                    'verbose',      1           ...
                );
elseif  strcmp(target_hardware, 'gpu')
    % compile with GPU
    vl_compilenn(   'enableGpu',    true,                                       ...
                    'cudaMethod',   'nvcc',                                     ...
                    'cudaRoot',     '/usr/local/cuda-7.5',                      ...
                    'enableCudnn',  true,                                       ...
                    'cudnnRoot',    '/u/eems/workspace1/yhchen/tools/cudnn-v4', ...
                    'mexDirName',   'mex_gpu',                                  ...
                    'verbose',      1                                           ...
                );
else
    error('COMPILE_MATCONVNET: please specify the target hardware for compilation.');
end