(def vals (string/split "\n" (string/trim (slurp "data/day2.txt"))))

(defn parse-line [line]
  (let [[word end] (string/split " " line)]
    (let [num (scan-number (string/trim end))]
      [word num])))

(defn move-sub [acc line]
  (let [[word num] (parse-line line)]
    (def [key val] (cond
      (= "forward" word) [:dist num]
      (= "down" word) [:depth num]
      (= "up" word) [:depth (- 0 num)]))
    (update acc key |(+ $ val)))))
(def res (reduce move-sub @{ :dist 0 :depth 0 } vals))
(pp (* ;(values res)))

# alternate part 1
(var depth 0)
(var dist 0)
(defn part1
  [line]
  (let [[word num] (parse-line line)]
    (cond
      (= "forward" word) (+= dist num)
      (= "down" word) (+= depth num)
      (= "up" word) (-= depth num))))

(with [f (file/open "data/day2.txt")]
  (loop [l :iterate (file/read f :line)]
    (part1 l)))
(print (* depth dist))

(defn part2 [vals]
  (var [depth dist aim] [0 0 0])
  (loop [line :in vals]
    (let [[word num] (parse-line line)]
      (cond
        (= "forward" word) (do (+= dist num) (+= depth (* aim num)))
        (= "down" word) (+= aim num)
        (= "up" word (-= aim num)))))
   (* depth dist))
(pp (part2 vals))
