;;;_#6 program-ab.el

(require 'cl nil t)

;; .................................
;; skeleton-html-mode-form ......
(defun ywb-skeleton-read-maybe (frt prompt &optional initial-input recursive)
  (let ((input (skeleton-read prompt initial-input recursive)))
    (if (not (string= input ""))
        (format frt input))))

;;;_ , c
(define-skeleton skeleton-c-mode-main-func
  "create int main(int argc, char * argv[]) automatic" nil
  "int main (int argc, char * argv[]) \n{\n"
  > _  "\n" > "return 0;"
  "\n}")
(define-skeleton skeleton-c-mode-comment-box
  "create a comment box" nil
  "/**********************************************\n"
  > " * " _ "\n"
  > " **********************************************/"
  )
(define-skeleton skeleton-perl-mode-new-func
  "generate class new subroutin automatic"
  nil
  "sub new {\n"
  > "my $_class = shift;\n"
  > "my $class = ref $_class || $_class;\n"
  > "my $self = {};\n";
  > "bless $self, $class;\n"
  > _ "\n"
  > "return $self;\n}\n")

;;;_ , perl
(define-skeleton skeleton-perl-mode-open
  "" nil
  > "open(" (ywb-skeleton-read-maybe "%s" "file handle: " "FH") ", "
  `(let ((file (skeleton-read "file: ")))
     (concat (case (aref file 0)
               (?$ (concat file ") || die \"Can't open file " file))
               (?> (concat "\"" file "\") || die \"Can't create file " (substring file 1)))
               (otherwise (concat "\"" file "\") || die \"Can't open file " file)))))
  ": $!\";\n"
  > _)

(define-skeleton skeleton-perl-mode-dump
  "" nil
  "print Dumper(" _ "), \"\\n\";")

(define-skeleton skeleton-perl-mode-tk
  "" nil
  "use Tk;\n"
  > "my $mw = MainWindow->new;\n"
  > _ "\n"
  > "MainLoop;")

(define-skeleton skeleton-perl-mode-dbi
  "" nil
  "use DBIx::Simple;\n"
  > "my @cp = ('dbi:mysql:" _ "', 'root');\n"
  > "my ($db, $sql, $result);\n"
  > "$db = DBIx::Simple->connect(@cp)\n"
  > "|| die DBIx::Simple->error;")

;;;_ , html
(define-skeleton skeleton-html-mode-form
  "" nil
  > "<form" (ywb-skeleton-read-maybe " action=\"%s\"" "action: ")
  (ywb-skeleton-read-maybe " method=\"%s\"" "method: ")
  ">\n"
  > _ "\n"
  > "</form>")

(define-skeleton skeleton-html-mode-input
  "" nil
  > "<input" (ywb-skeleton-read-maybe " type=\"%s\"" "type: ")
  (ywb-skeleton-read-maybe " name=\"%s\"" "name: ")
  (ywb-skeleton-read-maybe " value=\"%s\"" "value: ")
  ">"
  )

(define-abbrev-table 'c-mode-abbrev-table '(
    ("main" "" skeleton-c-mode-main-func 1)
    ("ccbox" "" skeleton-c-mode-comment-box 1)
    ))

(define-abbrev-table 'c++-mode-abbrev-table '(
    ("main" "" skeleton-c-mode-main-func 1)
    ("ccbox" "" skeleton-c-mode-comment-box 1)
    ))

(define-abbrev-table 'cperl-mode-abbrev-table '(
    ("subnew" "" skeleton-perl-mode-new-func 1)
    ("openf" "" skeleton-perl-mode-open 1)
    ("dump" "" skeleton-perl-mode-dump 1)
    ("usedbi" "" skeleton-perl-mode-dbi 1)
    ("usetk" "" skeleton-perl-mode-tk 1)
    ))

(define-abbrev-table 'html-mode-abbrev-table  '(
   ("formx" "" skeleton-html-mode-form 1)
   ("inputx" "" skeleton-html-mode-input 1)
))

;;;_ , metapost
;; ........ metapost .....................
(define-skeleton skeleton-metapost-mode-beginfig
  "" nil
  "beginfig(" (skeleton-read "fig id: "
                              (if (save-excursion
                                    (re-search-backward "beginfig(\\([0-9]+\\))" nil t))
                                  (number-to-string
                                   (1+ (string-to-number (match-string 1))))
                                "1")) ")\n"
  > _ "\n"
  "endfig;\n")
(define-abbrev-table 'meta-mode-abbrev-table '(
    ("begx" "" skeleton-metapost-mode-beginfig)
    ))

(define-skeleton skeleton-scheme-mode-define
  "" nil
  "(define " _ ")")
(define-skeleton skeleton-scheme-mode-lambda
  "" nil
  "(lambda (" (skeleton-read "Param: ") ") " _ ")")
(define-abbrev-table 'scheme-mode-abbrev-table '(
 ("dfx" "" skeleton-scheme-mode-define)
 ("ldx" "" skeleton-scheme-mode-lambda)
 ))

;; msf-abbrev ........... c . c++ ............
;; . c . cpp .......................
;; (when (featurep 'msf-abbrev)
;;   (dolist (hook '(c++-mode-hook c-mode-hook emacs-lisp-mode-hook
;;                                 cperl-mode-hook))
;;     (add-hook hook 'msf-abbrev-mode)))

;;; program-ab.el end here

