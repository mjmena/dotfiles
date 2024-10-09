$env.config = {
  show_banner: false
  completions : {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "fuzzy"
  }
}

alias z = cd
alias vi = nix run github:mjmena/mvim --  
