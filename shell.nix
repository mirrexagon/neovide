{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = (with pkgs; [
    cargo
    gcc
    curl
    binutils
    pkgconfig
    cmake
    zlib
    openssl
    freetype
    file
    expat
    sndio
    libglvnd
    neovim
  ]) ++ (with pkgs.xorg; [
    libX11
    libXext
    libXinerama
    libXi
    libXrandr
  ]);

  LD_LIBRARY_PATH = with pkgs; with pkgs.xorg; "${libX11}/lib:${libXext}/lib:${libXinerama}/lib:${libXi}/lib:${libXrandr}/lib:${libglvnd}/lib";

  CURL_CA_BUNDLE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
}
