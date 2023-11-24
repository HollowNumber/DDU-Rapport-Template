#let recursive_count(_body) = {
  let r(cont) = {
    let _C = 0
    
    if type(cont) == content {

      for key in cont.fields().keys() {

        if key == "children" {
          for _child in cont.fields().at("children") {
            let resp = r(_child)
            _C += resp
          }
          
        } else if key == "body" {
          _C += r(cont.fields().at("body"))
        } else if key == "text" {
          _C += cont.fields().at("text").len()
        }else if key == "child" {
          _C += r(cont.at("child"))
        } else if key == "block" {
          if cont.fields().keys().contains("text") {
            _C += cont.fields().at("text").len()
          }
        } else if key == "caption" {
          _C += r(cont.fields().at("body"))
          
        } else if key == "label" {
          _C += r(cont.fields().at("body"))
                      
        } else if key == "supplement" {
          _C += r(cont.fields().at("body")) 
        } else if ("func", "double", "key", "keys", "update", "base").contains(key) {
          // we can skip those
        } else if key == "t" {
          // math output - idk if I should count it
        } else if key == "b" {
          // math output - idk if I should count it
        } else if key == "path" {
          // image
        } else if key == "data" {

        } else if key == "accent" {
          // return [#cont]
        } else if key == "num" {
          // return [#cont]
        } else if key == "denom" {
          
        } else if key == "dest" {
          // return [#cont]
          
        } else if key == "level" {
          // return [#cont]
        }   
      }
    } else if type(cont) == array {
      
      for item in cont {
        _C += r(item)
      } 
    }
  return _C
}
  return r(_body)     
}