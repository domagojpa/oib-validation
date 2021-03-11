; OIB can start with 0 so for simplicity reasons input HAS to be of type text

(defn change-0-with-ten [num]
  (if (= 0 (mod num 10))
    10
    (mod num 10)))

(defn controll-number [num]
  (if (= 1 num)
    0
    (- 11 num)))

(defn oib-valid? [oib]
  (let [valid-input? (not= nil (re-matches #"\d{11}" oib))]
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
        (if (= controll-value (controll-number remainder))
          true
          false))
      false)))
