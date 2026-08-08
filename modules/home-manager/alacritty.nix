{ config, lib, pkgs, ... }:
let
  cfg = config.alacritty;
in
{
  options.alacritty = {
    enable = lib.mkEnableOption "enable alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        selection.save_to_clipboard = true;
        general.live_config_reload = true;
        window = {
          dynamic_title = true;
          startup_mode = "Maximized";
        };
        font = {
          normal.family = "JetBrainsMono Nerd Font";
          size = 11;
          offset = {
            x = 0;
            y = 1;
          };
        };
        keyboard.bindings = [
          {
            key = "Return";
            mods = "Shift";
            chars = "\u001b\r";
          }
        ];
      };
    };
  };
}
