{ config, lib, ... }:

{
  imports = [
    ../../common/cpu/amd
    ../../common/cpu/amd/pstate.nix
    ../../common/gpu/nvidia/prime.nix
    ../../common/gpu/nvidia/ampere
    ../../common/pc/laptop
    ../../common/pc/ssd
  ];

  # Enables ACPI platform profiles
  boot = lib.mkIf (lib.versionAtLeast config.boot.kernelPackages.kernel.version "6.1") {
    kernelModules = [ "hp-wmi" ];
  };

  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
