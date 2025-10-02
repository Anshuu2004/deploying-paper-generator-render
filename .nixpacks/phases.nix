{ pkgs }: {
  setup = {
    packages = with pkgs; [
      # Core WeasyPrint dependencies
      pango
      cairo
      gobject-introspection
      # Other libraries that often help with fonts and images
      libffi
      libxml2
      libxslt
      librsvg
    ];
  };
}