json.results(@results) do |result|
  json.extract! result,
                :id,
                :value1,
                :value2,
                :result,
                :operation
end