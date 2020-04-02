# require modules here

require 'yaml'
require 'pry'

def load_library(data)
  # code goes here
  
  emoticon_hash = YAML.load_file(data)

  result = {}

  emoticon_hash.collect do |key, value|
    result[key] = {}
    result[key][:english] = value[0]
    result[key][:japanese] = value[1]
    
    #### when you create a new hash with new keys and the specific data structure has been given then just use data's index instead of another enumerable. So code can get simple.
    
    # value.collect do |new_key, new_value|
    #   new_value.collect do |emoticon|
    #     if !result[key]
    #       result[key] = {}
    #     end
    #     result[key][new_key] << emoticon
    #   end
    # end
    #  
    
  end
  
result
end

# {"angel"=>{:english=>"O:)", :japanese=>"☜(⌒▽⌒)☞"},
# "angry"=>{:english=>">:(", :japanese=>"ヽ(ｏ`皿′ｏ)ﾉ"},
# "bored"=>{:english=>":O", :japanese=>"(ΘεΘ;)"},
# "confused"=>{:english=>"%)", :japanese=>"(゜.゜)"},
# "embarrassed"=>{:english=>":$", :japanese=>"(#^.^#)"},
# "fish"=>{:english=>"><>", :japanese=>">゜))))彡"},
# "glasses"=>{:english=>"8D", :japanese=>"(^0_0^)"},
# "grinning"=>{:english=>"=D", :japanese=>"(￣ー￣)"},
# "happy"=>{:english=>":)", :japanese=>"(＾ｖ＾)"},
# "kiss"=>{:english=>":*", :japanese=>"(*^3^)/~☆"},
# "sad"=>{:english=>":'(", :japanese=>"(Ｔ▽Ｔ)"},
# "surprised"=>{:english=>":o", :japanese=>"o_O"},
# "wink"=>{:english=>";)", :japanese=>"(^_-)"}}

def get_english_meaning(data, emoticon)
  
  emot_library = load_library(data)
  
  result = emot_library.keys.find do |key|
    emot_library[key][:japanese] == emoticon
  end
  
  if result 
    result
  else
    "Sorry, that emoticon was not found" 
  end
end


def get_japanese_emoticon(data, emoticon)
  
  e_library = load_library(data)
  
  japanese_emot = e_library.keys.find do |key|
    e_library[key][:english] == emoticon
  end
  
  if japanese_emot
    e_library[japanese_emot][:japanese]
  else
    "Sorry, that emoticon was not found" 
  end
  
end


# def get_english_meaning(data, emoticon)
#   # code goes here
#   emot_library = load_library(data)
  
#   emot_library.each do |key,value|
  
#     value.each do |lang_key, emot_value|
# binding.pry      
#       if emot_library[key][emot_value] == emoticon
#         return emot_library[key]
#       end
#     end
#   end
# end

# def get_japanese_emoticon(data, emoticon)
#   # code goes here
#   e_library = load_library(data)
  
#   e_library.each do |key,value|
#     e_library[value].each do |lang_key, emot_value|
#       if e_library[value][emot_value] == emoticon
#         return e_library[key][:japanese]
#       end
#     end
#   end
# end


