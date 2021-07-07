# require modules here
require 'pry'
require 'yaml'


def load_library(emo_file)
  # code goes here
 emo_hash = YAML.load_file(emo_file) 
 
 hash = emo_hash.each do |k, a|
         emo_hash[k] = {}
         emo_hash[k][:english] = a[0]
         emo_hash[k][:japanese] = a[1]
       end
hash
end

def get_japanese_emoticon(emo_file, eng_emo)
  # code goes here
hash = load_library(emo_file)
  
  emoticon = hash.keys.find do |key|
    hash[key][:english] == eng_emo
  end
  
  emoticon ? hash[emoticon][:japanese] : "Sorry, that emoticon was not found"
  
end

def get_english_meaning(emo_file, jp_emo)
  # code goes here
  hash = load_library(emo_file)
  
  meaning = hash.keys.find do |key|
    hash[key][:japanese] == jp_emo
  end
  
  meaning ? meaning : "Sorry, that emoticon was not found"
end