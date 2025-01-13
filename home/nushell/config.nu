use ~/.cache/starship/init.nu

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
        { clear --keep-scrollback}
        { ||
          if (which direnv | is-empty) {
            return
          }

          direnv export json | from json | default {} | load-env
        }
      ]
    }
  }
}


