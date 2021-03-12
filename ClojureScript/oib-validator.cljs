; OIB can start with 0 so for simplicity reasons input HAS to be of type text

(defn oib-valid?
  "Function for validating OIB number; expected input is of type text, return is boolean"
  [oib]
  (let [valid-input? (not= nil (re-matches #"\d{11}" oib))
        change-0-with-ten (fn [num] (if (= 0 (mod num 10)) 10 (mod num 10)))
        controll-number (fn [num] (if (= 1 num) 0 (- 11 num)))]
    (if valid-input?
      (let [first-ten-numbers (take 10 oib)
            controll-value (js/parseInt (last oib))
            remainder (-> (fn [acc first-ten-numbers]
                            (->> first-ten-numbers
                                 (js/parseInt)
                                 (+ acc)
                                 (change-0-with-ten)
                                 (* 2)
                                 (#(mod % 11))))
                          (reduce 10 first-ten-numbers))]
        (= controll-value (controll-number remainder)))
      false)))
