json.result do
  json.extract! @calculation_result,
                :id,
                :value1,
                :value2,
                :operation,
                :result
end
