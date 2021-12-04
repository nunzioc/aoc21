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
# hmm maybe i should reduce using a table as my accumulater
