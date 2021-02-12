munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, values|
  case values["age"]
  when 0..17
    values["age_group"] = "kid"
  when 18..64
    values["age_group"] = "adult"
  else
    values["age_group"] = "senior"
  end
end

puts munsters
