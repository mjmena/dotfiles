$env.config = {
  show_banner:false
  completions:{
    case_sensitive:false
    quick:true
    partial:true
    algorithm:"fuzzy"
  }
  hooks:{
    env_change:{
      PWD:[
      ]
    }
  }
}

alias z = cd
alias test = nix run ~/mvim --
