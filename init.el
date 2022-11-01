(setq emacs-host-list '("arch" "arch without roam" "ros" "mac"))
(setq weiss/init-path "~/.emacs.d")

(defun with-init-path (p)
  "DOCSTRING"
  (interactive)
  (concat weiss/init-path p)
  )

(load (with-init-path "/weiss-emacs-host.el"))
(load (with-init-path "/emacs-config/weiss_init.el"))

(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f46746b4210103ca77902d363106381922140379c2dca8cc9b9229168045e224" "a00a3dea827d0b211cd65bda124c85fb798a6c4ce5c3445467e1ce975c564b0b" "d2144d15bd9495b3ec4b5ee245064098b770170e63ba09edfd5bd710381e88d5" "33b6f8e82e9aebba42a46acd2feb3721a3407c1128af757b9bb87ed2e6a998db" "93eba63dd6f596aa6c4f3301ef942c102c46871b67b4e445cca92fbba144a835" "20241c5b00f9ab83c9e573576c054c25cf420eb2f822e4b0899a457914774788" "e1b47c0e1fe4dec0a046eb96cae55c8d2689b5f6c0ec2644ad723129101595ac" "f67eb6a998a0f0f684f772ae5b25507ead75137805341a781b1177659870ddd1" "0cc2fc90fb5ff1a8083c8e2133898640c276d63b76346c0276ebd6648d553b62" "b924d011d76dc5e57fc13e14a476ecac905a62b4518968974c967ff30c22a8b2" "4f9b8353d1a9fb497cfc4a6af28f41ed092be06472b7acaa683a6fe71be4d839" "d7bbc1261e9ea29e3f3b57c7505a8a4ff29eafa304124d9b790c03aa8535de81" "aebae0b499c4dc1328aa96659c2839ee7dbcc92d4ed54558c8e13ecc9bbb12bc" "f4d852042347ddabfa94e44d0877b8317273646cfab3459ac038291fdea6cc8d" "53a0f6198bb351b1115716098d3bee2f0e1bb5a8bbac104caf8f074eec4fd955" "ccfdcd6fee763a3fcb42f8c78f58199882e0d7d88fa498b7568699602e936778" "83286ce56b0ec7125bee84fc5013024f3ebfce6729c2a6479b4d2686fd85629a" "49f67185bfca649f0b458bf3cf65ba87e4811f740233b983e6c377b4704e1ccc" "0565e6329218375894e06a2ec4a5a770b9ff66b73ed0ea15fea24efb25377ea4" "bdff80ad07cb999140c02dcc848097ddd42f481bdc8800d0080564216af3183d" "c8d4cf46fcfc42767cd25e189040e492be538b1f9ed20b9ec386ebd39dbdce5a" "02c02e6ebdd25a8e861830353be72c93754698d3cc6c2ee48dfefe42249828f1" "20b9763df178029dee775e4308533059bafdd9fd6a5296e9d775308e106bcfab" "e19dac8b252e9b62b0c0cbb909154e34ad0efb84f398271509b08e001e9d53cb" "9e1d5274194d442c5f311fb5d9088f74fa3b184eafc5c599622219c5a3dd069a" "71280c399718a94d157053249f16dd618eafb4d135fa236e08f81d072070b997" "bb8577dd6e20a21bd44335187888857ae193d0da5ec4736289d964a5da1275e4" "7782974cd3a49e4e726b98ff70b573564ff21ddeb390d63e5884e83d7b57058a" "e91ae3e5ccbe7eb00d0f4defb17062d83888e8aa3d79aa7c412db31dd4360022" "839588f8de0e8b496a6e2ecb7f42a428b273cafb808b3fa1dc9a224ead0d0214" "7c50eb0d78368e34fe9145122465d8d339bf8bb1f82a6854e3284c7c1481c20e" "b2ae2f5df81e0d8c6a9ec81d1ea57d13283ec348d834e7cd78eb2602e4909648" "c1cffe088e11ab7d7d5cee683500e3c6c94f6867d9d6cf271ad60c86b28ee510" "ed169bb5079ad9bdafe952643c680fdc7f1502c68fa20ceabd7d8860d62f6197" "03e55eb83bfdeaa9b7882d8618177e322bd37fe8ebada4d67d4cda5a5f3718d8" "9567a79927107f1dd8293f80c783e31abd72b610b8a893c80c6f4a8cca914e26" "da884490c9581d464f1bcd68bdd99e6f54e9c3f4c3a5149fc67185821a59f56d" "a25fe2525695f76d5ff42550790daf0c036e00058512578ef6cb02dc14cd363e" "d0bdabe49441c4e2a31c90ea0fe841c26659a2b9a9ac65023665b6fa2807641e" "9aac2c00569876f5baa5f7a889a285b172b84aa8d2a2cd8d4524649935123415" "5d1a5fb5736998a28c69e346e87fb93e1f08b778181d9616e6bbc5d61c9229a6" "a1000d2930f0d19f773ebdd5e5c75a6b06998adaadcf3ffc6d5ff0be318f975d" "2300bd357fa4ba07bb17ac6e415ac9c81d7021eed2329123213aa96ddec49a95" "724b3e91adbe5937aa44946a93d1c4d3ba9df4ee403abd5750a788d4cc3d3830" "b976099b3daa80a23168601479601940f9fd58f06d82fce8ec4952e89874796b" "5f64d6d1ae640a47b5949340b259f76ff5085b506f3a2126e5377a8e9d918b32" "0eb3fa75966df6a010d530ba50fc9a1df7e3b1e063ba6e98b1977e3deea6b37b" "ef12614eb5a5e3e5db5829328fb63741b415ccad9c8a3e0b66fbe5497aaf0577" "fee29d142f4acae13b498fc645649c36a048c9a275fc4317a883290069da4f16" "a55aaa1744465cc15f26188207072015a0fff9b209eb39e8eaf2f4c63e9fa833" "7aec6e207dd335c03a4de26e162776687ecb27a114197c835ee9a3962e9ccbc4" "427e9db080f324c1fccf45cb3ee63a4e84c0656aad3ea803d41d48a82fa0563c" "530c75d3b8f0161ac6e15949b69ca5a479473b843c99e5cb2f0d136fa20fa2d3" "8d528eee820edd559c9e79ab06fd676995ad362d142c10883c9fb38f883799e3" "98819952b52551f3a184386bc8c21ddaf44e3a5b122268f256986a1992e7262b" "4b6bce255203c72ce24b14b6d52aa1da86ad9f6fa0db41a29fb16bbcc5bb7b4d" "b8786ccc530be8ca6ea59591c0257ee5ac29911f503b4628f3654020eae02da1" "ead3bdcb492a28ed8eb9edcfcb90de7599309859dfbec92e2fb7e31cc3014856" "db3b6683f751cd55c9384712212682c3aec6a0a760fd2d7731280c2609a9c687" "6deb79b25802f64bb840654398035ce5fa37964c18bce766149ca7715ecaac54" "96a2a3642ed0dd32bf20ff590cadbb2c160d685ee8b16538f0f563a5ead5961e" "a11e6d7a82bb44a5f0dff28cff54a8fc021acb0dc93edfc08b404f1c160e7683" "9ce6195297390515f41478fe0c14396781161428eb293b809e8d13c9d5fbf247" "d74f5e4627af7cc5148d8046cf721df4d3060401e313b3c1ec2d3a62564b48f4" "1ad5c49c527d8c6706ed96f4fb0b165f4217870d4d66c996c3e5b8c94a2492e3" "783667ec8a492aad7f7dda027dece7651a878622f5eb42a55915d25ba95599d7" "c117ffb1570ce4ff9b9d6eb98565dd0887591858b72d65831ea25b3c7ce7f0fa" "7c4533eff92406653aa9873e66155698905a394f07606576d9051000967dba91" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" default))
 '(ignored-local-variable-values '((eval eglot-ensure)))
 '(safe-local-variable-values
   '((weiss-pdf-candidates "~/Documents/Vorlesungen/Middleware/middleware_Slides/Chapter3-DBGateways.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/Middleware/middleware_Slides/Chapter3-DBGateways.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/Middleware/Slides/Chapter 2 - Distributed Information Systems.pdf")
     (comment-fill-column . 80)
     (eval eglot-ensure)
     (org-latex-default-class . "report")
     (weiss-org-image-folder . "/home/weiss/Documents/Org-roam/orgzly/fig/")
     (weiss-org-image-folder . "/home/weiss/Documents/Org-roam/orgzly/fig")
     (weiss-org-image-folder . "/home/weiss/Documents/Vorlesungen/bachelorarbeit/org/fig/")
     (org-latex-default-class . "dbis-thesis")
     (org-latex-default-class . "weiss-Paper")
     (org-latex-default-class . "weiss-paper")
     (weiss-org-image-folder . "/home/weiss/Documents/Vorlesungen/bachelorarbeit/org/fig")
     (org-latex-default-class . "article")
     (weiss-org-image-folder . "/home/weiss/Documents/Vorlesungen/Seminar/bachelor/report/fig/")
     (go-test-args . "-timeout 300ms")
     (go-test-args . "-timeout 0ms")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/PA/PA-ALL-1.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/PA/PA-ALL-1_flatten.pdf")
     (lsp-haskell-server-path . "haskell-language-server-8.10.4")
     (lsp-haskell-server-path . "/usr/bin/haskell-language-server-8.10.4")
     (lsp-haskell-server-path . "/usr/bin/haskell-language-server-8.10.5")
     (company-backends
      (company-citre :separate))
     (elisp-lint-indent-specs
      (describe . 1)
      (it . 1)
      (org-element-map . defun)
      (org-roam-with-temp-buffer . 1)
      (org-with-point-at . 1)
      (magit-insert-section . defun)
      (magit-section-case . 0)
      (->> . 1)
      (org-roam-with-file . 2))
     (elisp-lint-ignored-validators "byte-compile" "package-lint"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
