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

# trying out recursion
# it seems pretty mediocre in janet
(defn recurse [nums count prev]
  (match nums
    () count
    [n] (let [rest (slice nums 1)]
          (if (> n prev)
            (recurse rest (inc count) n)
            (recurse rest count n)))))

(pp (recurse nums 0 nil))


(print "Part 2:")
(def sums
  (seq [i :range [0 (- (length nums) 2)]]
    (sum (slice nums i (+ i 3)))))
(part1 sums)

# alternative using a helper function
# maybe a bit too fancy but windows is a cool abstraction
(defn windows [len ind]
  (seq [i :range-to [0 (- (length ind) len)]]
    (slice ind i (+ i len))))
# part one again but now using windows
(defn part1alt [nums]
  (count |(< ;$) (windows 2 nums)))
(->>
 (windows 3 nums)
 (map sum)
 (part1alt)
 (pp))
