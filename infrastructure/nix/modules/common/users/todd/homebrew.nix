{ ... }:
{
  environment = {
    systemPath = ["/opt/homebrew/bin"];
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = {
      "1Blocker - Ad Blocker" = 1365531024;
    };
    casks = [
      "gpg-suite-no-mail"
    ];
    taps = [];
    brews = [
      "mas"
      "watch"
    ];
  };
}
