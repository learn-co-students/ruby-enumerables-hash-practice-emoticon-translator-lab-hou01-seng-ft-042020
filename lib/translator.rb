# require modules here
require "yaml"
  
  
def load_library(path)

  emoticons = YAML.load_file(path)
  japenese_to_english = {}
  english_to_japenese = {}
  translator = emoticons.reduce({}) do |memo, (key, value)|
    japenese_to_english[value[1]] = key
    english_to_japenese[value[0]] = value[1]
    memo = {
      "get_meaning": japenese_to_english,
      "get_emoticon": english_to_japenese
    }
    memo
  end 
  translator
end

def get_japanese_emoticon(path, emoticon)
  translator = load_library(path)
  emote = translator[:get_emoticon][emoticon]
  return emote unless emote == nil 
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  translator = load_library(path)
  meaning = translator[:get_meaning][emoticon]
  return meaning unless meaning == nil 
  "Sorry, that emoticon was not found"
end
