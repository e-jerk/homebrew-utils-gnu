# GPU-Accelerated Unix Utilities (GNU-Fallback)

Drop-in replacements for `find`, `gawk`, `grep`, and `sed` with GPU acceleration via Metal (macOS) and Vulkan (Linux/cross-platform). This tap provides **GNU-fallback builds** that include the GNU implementations for full POSIX compliance.

## Build Variants

Each utility is available in two variants:

| Variant | Description | Dependencies | `--gnu` flag |
|---------|-------------|--------------|--------------|
| **pure** | Zig + SIMD + GPU only | None | Not available |
| **gnu** | Includes GNU utilities for full POSIX compliance | GNU coreutils | Falls back to GNU implementation |

The **pure** build is self-contained with no external dependencies. The **gnu** build includes GNU utilities for features not yet implemented natively (e.g., backreferences in sed, `-exec` in find).

## Installation

### Homebrew

This tap provides **GNU-fallback versions** of the utilities with full POSIX compliance.

```bash
# Add the tap
brew tap e-jerk/utils-gnu

# Install all utilities at once
brew install e-jerk/utils-gnu/utils-gnu

# Or install individually
brew install e-jerk/utils-gnu/find
brew install e-jerk/utils-gnu/gawk
brew install e-jerk/utils-gnu/grep
brew install e-jerk/utils-gnu/sed
```

For pure GPU versions (no external dependencies), use the [e-jerk/utils](https://github.com/e-jerk/homebrew-utils) tap instead:

```bash
brew tap e-jerk/utils
brew install e-jerk/utils/utils
```

## Quick Start

All utilities work as drop-in replacements with automatic backend selection:

```bash
find . -name "*.txt"
gawk '/pattern/' file.txt
grep "error" server.log
sed 's/foo/bar/g' config.txt
```

Force GPU acceleration with `--gpu` or use `--cpu` for comparison:

```bash
grep --gpu "pattern" largefile.log
gawk --gpu '/pattern/' largefile.txt
sed --cpu 's/old/new/g' file.txt
```

Use the GNU implementation directly:

```bash
grep --gnu "complex-pattern" file.txt
sed --gnu 's/regex/replacement/' file.txt
```

---

## Backend Selection

All utilities support the same backend flags:

| Flag | Description | Build |
|------|-------------|-------|
| `--auto` | Automatically select optimal backend (default) | Both |
| `--gpu` | Use GPU (Metal on macOS, Vulkan elsewhere) | Both |
| `--cpu` | Force CPU backend (SIMD-optimized) | Both |
| `--gnu` | Force GNU implementation (full POSIX compliance) | **gnu only** |
| `--metal` | Force Metal backend (macOS only) | Both |
| `--vulkan` | Force Vulkan backend | Both |
| `-V, --verbose` | Show timing and backend information | Both |

### Optimization Annotations

Each flag in `--help` output shows its optimization status:

| Annotation | Description |
|------------|-------------|
| `[GPU+SIMD]` | GPU-accelerated (Metal/Vulkan) + SIMD-optimized CPU fallback |
| `[SIMD]` | SIMD-optimized CPU only (GPU implementation pending) |
| `[CPU]` | CPU-only (requires filesystem syscalls or complex logic) |

## Requirements

### macOS
- Apple Silicon or Intel Mac with Metal support (built-in)
- MoltenVK recommended for Vulkan backend (`brew install molten-vk`)

### Linux
- Vulkan runtime: `apt install libvulkan1 mesa-vulkan-drivers`
- GPU with Vulkan support (AMD, Intel, NVIDIA, or software rendering)

## Upgrading

```bash
# Upgrade all utilities
brew upgrade e-jerk/utils-gnu/utils-gnu

# Upgrade individually
brew upgrade e-jerk/utils-gnu/find
brew upgrade e-jerk/utils-gnu/gawk
brew upgrade e-jerk/utils-gnu/grep
brew upgrade e-jerk/utils-gnu/sed
```

## Building from Source

Each utility can be built from source using Zig 0.15.2+:

```bash
git clone https://github.com/e-jerk/grep
cd grep
zig build -Doptimize=ReleaseFast
```

See individual repositories for detailed build and test instructions:
- [find](https://github.com/e-jerk/find)
- [gawk](https://github.com/e-jerk/gawk)
- [grep](https://github.com/e-jerk/grep)
- [sed](https://github.com/e-jerk/sed)

## License

Source code: [Unlicense](LICENSE) (public domain)
Binaries: GPL-3.0-or-later
