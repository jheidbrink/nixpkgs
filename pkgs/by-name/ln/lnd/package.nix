{
  buildGoModule,
  fetchFromGitHub,
  lib,
  tags ? [
    # `RELEASE_TAGS` from https://github.com/lightningnetwork/lnd/blob/master/make/release_flags.mk
    "autopilotrpc"
    "chainrpc"
    "invoicesrpc"
    "kvdb_etcd"
    "kvdb_postgres"
    "kvdb_sqlite"
    "monitoring"
    "neutrinorpc"
    "peersrpc"
    "signrpc"
    "walletrpc"
    "watchtowerrpc"
    # Extra tags useful for testing
    "routerrpc"
  ],
}:

buildGoModule rec {
  pname = "lnd";
  version = "0.18.3-beta";

  src = fetchFromGitHub {
    owner = "lightningnetwork";
    repo = "lnd";
    rev = "v${version}";
    hash = "sha256-CNCMVYuLUVmNgW5YTTn3TR1+2UCLbF3/gXXZWiREj/E=";
  };

  vendorHash = "sha256-dr8Ra8ywy+Zow8JF3K21XZ7lDIIdxvjRz+OD3E+348o=";

  subPackages = [
    "cmd/lncli"
    "cmd/lnd"
  ];

  inherit tags;

  meta = with lib; {
    description = "Lightning Network Daemon";
    homepage = "https://github.com/lightningnetwork/lnd";
    license = licenses.mit;
    maintainers = with maintainers; [
      cypherpunk2140
      prusnak
    ];
  };
}
