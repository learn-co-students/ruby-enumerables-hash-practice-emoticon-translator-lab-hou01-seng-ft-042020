require 'pry'
# require modules here
=begin
depending on the syntax that you use, Ruby converts a given String key into a Symbol. 
So, if declare a hash using the hash-rocket, the resulting key remains a String:
hash = {"angel" => {}}
hash #=> {"angel"=>{}}

However, if the alternate syntax is used, the key will be converted:
hash = {"angel": {}}
hash #=> {:angel=>{}}

The tests will accept either, but you will need to be consistent in your own code when referencing hash keys. 
YAML will not convert the emoticons to symbols when reading emoticons.yml.

loaded hash = {"angel"=>["O:)", "☜(⌒▽⌒)☞"], 
"angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"], 
"bored"=>[":O", "(ΘεΘ;)"], 
"confused"=>["%)", "(゜.゜)"], 
"embarrassed"=>[":$", "(#^.^#)"], 
"fish"=>["><>", ">゜))))彡"], 
"glasses"=>["8D", "(^0_0^)"], 
"grinning"=>["=D", "(￣ー￣)"], 
"happy"=>[":)", "(＾ｖ＾)"], 
"kiss"=>[":*", "(*^3^)/~☆"], 
"sad"=>[":'(", "(Ｔ▽Ｔ)"], 
"surprised"=>[":o", "o_O"], 
"wink"=>[";)", "(^_-)"]}
=end

def load_library(file)
  # code goes here
  
  require 'yaml'
  library_hash = YAML.load_file(file)
  new_hash = {}
  library_hash.reduce({}) do |memo, (key, value)|
    new_hash[key] = {:english => value[0], :japanese => value[1]}
    memo
  end
new_hash
end


def get_english_meaning(file, j_emoticon)
  # code goes here
  library_hash = load_library(file)
  #binding.pry
  library_hash.reduce({}) do |memo, (key, value)|
    #binding.pry
    name = key
    value.reduce({}) do |memo, (key, value)|
      if value.include? j_emoticon
       return name
      end 
      memo
    end

    memo
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file, english_emoticon)
  library_hash = load_library(file)
  library_hash.reduce({}) do |memo, (key, value)|
      if value[:english] == english_emoticon
        return value[:japanese] 
      end 
    memo
    end

  # code goes here
=begin
{"angel"=>{:english=>"O:)", :japanese=>"☜(⌒▽⌒)☞"},
 "angry"=>{:english=>">:(", :japanese=>"ヽ(ｏ`皿′ｏ)ﾉ"},
 "bored"=>{:english=>":O", :japanese=>"(ΘεΘ;)"},
 "confused"=>{:english=>"%)", :japanese=>"(゜.゜)"},
 "embarrassed"=>{:english=>":$", :japanese=>"(#^.^#)"},
 "fish"=>{:english=>"><>", :japanese=>">゜))))彡"},
 "glasses"=>{:english=>"8D", :japanese=>"(^0_0^)"},
 "grinning"=>{:english=>"=D", :japanese=>"(￣ー￣)"},
 "happy"=>{:english=>":)", :japanese=>"(＾ｖ＾)"},
 "kiss"=>{:english=>":*", :japanese=>"(*^3^)/~☆"},
 "sad"=>{:english=>":'(", :japanese=>"(Ｔ▽Ｔ)"},
 "surprised"=>{:english=>":o", :japanese=>"o_O"},
 "wink"=>{:english=>";)", :japanese=>"(^_-)"}}
take a traditional Western emoticon (i.g. :)) 
and translate it to its Japanese version ((＾ｖ＾)).
usage:

   get_japanese_emoticon("./lib/emoticons.yml", ":)")
    # => "(＾ｖ＾)"
   get_japanese_emoticon("./lib/emoticons.yml", ":o")
    # => "o_O"
=end
  return "Sorry, that emoticon was not found" 
end