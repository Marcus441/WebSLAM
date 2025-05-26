{
  description = "C/C++ environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        llvm = pkgs.llvmPackages;
        stdenv = llvm.libcxxStdenv;
      in
      {
        devShell = pkgs.mkShell.override { inherit stdenv; }
          {
            name = "WebSLAM";
            buildInputs = with pkgs; [
              # builder
              gnumake
              cmake
              bear

              # debugger
              # llvm.lldb
              gdb

              # Clang 
              llvm.clang-tools
              llvm.clang-unwrapped
              llvm.libcxxClang

              # libs
              glm
              SDL2
              SDL2_gfx
            ];
            env = {
              CLANGD_FLAGS = "--query-driver=${pkgs.lib.getExe stdenv.cc}++";
              CC = "${llvm.clang-unwrapped}/bin/clang";
              CXX = "${llvm.clang-unwrapped}/bin/clang++";
              CXXFLAGS = "-std=c++20 -stdlib=libc++";
              LDFLAGS = "-stdlib=libc++";
            };
            shellHook = ''
              export CLANG_CXX=${llvm.clang-unwrapped}/bin/clang++
              export CLANG=${llvm.clang-unwrapped}/bin/clang
              echo "C/C++ development environment activated!"
              echo "Using Clang version: $(clang --version | head -n 1)"
            '';
          };
      }
    );
}
