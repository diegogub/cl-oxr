(defpackage cl-oxr
  (:use :cl)
  (:export :latest
           :get-rate
           :get-rates
           :*oxr-api-key*))
(in-package :cl-oxr)


(defvar *oxr-api-key* "")

(defvar *oxr-api-url* "https://openexchangerates.org/api")



(defun latest (&key (base "USD") (prettyprint nil) (show-alternatives nil) (symbols ""))
  "Gets latest current exchanges."
  (let ((url (concatenate 'string *oxr-api-url* "/latest.json?app_id=" *oxr-api-key*)))
    (when prettyprint
      (setf url (concatenate 'string url "&prettyprint=true")))
    (when symbols
      (setf url (concatenate 'string url "&symbols=" symbols)))
    (when base
      (setf url (concatenate 'string url "&base=" base)))
    (handler-case 
        (let ((res (dex:get url)))
        (cl-json:decode-json-from-string res))
      (t () nil))))


(defun get-rate (latest-rates currency)
  "One rate from latest rates"
  (let ( (ckey (intern (concatenate 'string "+" currency "+") :keyword)))
    (if latest-rates 
      (cdr (assoc ckey (cdr (assoc :rates latest-rates))))
      nil)))

(defmacro get-rates (latest-rates currencies)
  "Returns multiple rates from latest result."
  `(let ((l ,latest-rates))
    `,(list 
       (loop for i in ,currencies collect
          `,(cons i `,(get-rate l i))))))
