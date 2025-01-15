{
  services.coredns.enable = true;
  services.coredns.config = ''
    . {
      # Cloudflare and Google
      forward . 10.42.0.53 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4
      cache
    }

    localhost {
      template IN A  {
          answer "{{ .Name }} 0 IN A 127.0.0.1"
      }
    }
  '';
}
