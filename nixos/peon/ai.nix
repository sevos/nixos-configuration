{ pkgs, ... }:

{

  services.ollama = {
    enable = true;
    openFirewall = true;
    acceleration = "cuda";
    host = "0.0.0.0";
  };

  environment.systemPackages = with pkgs; [
    openai-whisper
    unstable.lmstudio
  ];
}
