(def nums
  (->>
   (slurp "data/one.txt")
   (string/split "\n")
   (map |(scan-number $))))
# get rid of nil value at the end of nums
(array/pop nums)

(print "Part 1:")
(defn part1 [nums]
  (var count 0)
  (reduce2 (fn [n1 n2] (if (< n1 n2) (++ count)) n2) nums)
  (print count))
(part1 nums)
# alternative
(do (var count 0) (var prev nil)
  (each n nums (if (> n prev) (++ count)) (set prev n))
  (print count))

(print "Part 2:")
(def sums
  (seq [i :range [0 (- (length nums) 2)]]
    (sum (slice nums i (+ i 3)))))
(part1 sums)
