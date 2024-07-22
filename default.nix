_:

{
  imports = [
    ./config
    ./plugins
    ./utils
  ];

  config = {
    # Use <Space> as leader key
    globals.mapleader = " ";

plugins.whakatime.enable = false;

    # Set 'vi' and 'vim' aliases to nixvim
    viAlias = true;
    vimAlias = true;

    # Setup clipboard support
    clipboard = {
      # Use xsel as clipboard provider
      providers.xsel.enable = true;

      # Sync system clipboard
      register = "unnamedplus";
    };
  };
}
