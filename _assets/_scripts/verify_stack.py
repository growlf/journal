import torch
import sys
print(f"Python Version: {sys.version.split()[0]}")
print(f"PyTorch Version: {torch.__version__}")
cuda_avail = torch.cuda.is_available()
print(f"CUDA Available: {cuda_avail}")
if cuda_avail:
    print(f"GPU Device: {torch.cuda.get_device_name(0)}")
    print(f"VRAM Total: {torch.cuda.get_device_properties(0).total_memory / 1024**3:.2f} GB")
    print(f"CUDA Capability: {torch.cuda.get_device_capability(0)}")
    x = torch.randn(1, 3).to("cuda")
    print("CUDA Tensor Op: SUCCESS")
else:
    sys.exit(1)
