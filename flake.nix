{
  description = "C/C++ environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, utils, ... }:
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
              CXXFLAGS = "-std=c++20";
              LDFLAGS = "-stdlib=libc++";
              CLANG_CXX = "${llvm.clang-unwrapped}/bin/clang++";
              CLANG = "${llvm.clang-unwrapped}/bin/clang";
            };
            shellHook = ''
              echo "C/C++ development environment activated!"
              echo "Using Clang version: $(clang --version | head -n 1)"
            '';
          };
      }
    );
}
