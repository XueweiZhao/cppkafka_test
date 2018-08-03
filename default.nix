with import <nixpkgs> {};
let
  cppkafka =
    stdenv.mkDerivation {
      name = "cppkafka";
      src = fetchFromGitHub {
        owner = "mfontanini";
        repo = "cppkafka";
        rev = "df04b27e226cb2059a37f5f64e046b7af5e4b71e";
        sha256 = "15ka0wgfh6m7cmq37mr4ffl6xm89qdd5djplbx5krpvas9msp5yj";
      };
      nativeBuildInputs = [ cmake ];
      cmakeFlags = [
        "-DCPPKAFKA_DISABLE_TESTS=ON"
      ];
      propagatedBuildInputs = [
        boost
        rdkafka
      ];
    };
in
  stdenv.mkDerivation {
    name = "cppkafka_test";
    src = lib.sourceFilesBySuffices ./. [
      ".cpp"
      ".txt"
    ];
    nativeBuildInputs = [ cmake ];
    buildInputs = [
      cppkafka
    ];
  }
