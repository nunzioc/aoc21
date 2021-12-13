(def vals (string/split "\n" (string/trim (slurp "data/day2.txt"))))

(defn move-sub [acc el]
  (let [[word end] (string/split " " el)]
    (let [num (scan-number (string/trim end))]
    (cond
      (= "forward" word) (update acc :dist |(+ $ num))
      (= "down" word) (update acc :depth |(+ $ num))
      (= "up" word) (update acc :depth |(- $ num))))))
(def res (reduce move-sub @{ :dist 0 :depth 0 } vals))
(pp (* ;(values res)))

# alternate part 1
(var depth 0)
(var dist 0)
(defn part1
  [line]
  (let [[word end] (string/split " " line)]
    (def num (scan-number (string/trim end)))
    (cond
      (= "forward" word) (+= dist num)
      (= "down" word) (+= depth num)
      (= "up" word) (-= depth num))))

(with [f (file/open "data/day2.txt")]
  (loop [l :iterate (file/read f :line)]
    (part1 l)))
(print (* depth dist))
