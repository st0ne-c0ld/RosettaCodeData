(defun spiral (rows columns)
  (do ((N (* rows columns))
       (spiral (make-array (list rows columns) :initial-element nil))
       (dx 1) (dy 0) (x 0) (y 0)
       (i 0 (1+ i)))
      ((= i N) spiral)
    (setf (aref spiral y x) i)
    (let ((nx (+ x dx)) (ny (+ y dy)))
      (cond
       ((and (< -1 nx columns)
             (< -1 ny rows)
             (null (aref spiral ny nx)))
        (setf x nx
              y ny))
       (t (psetf dx (- dy)
                 dy dx)
          (setf x (+ x dx)
                y (+ y dy)))))))