struct HighlightStyleSelectors {
    static func light(_ name: HighlightStyle.Name) -> StaticString {
        switch name {
        case .a11y:
            /*
             Theme: a11y-light
             Author: @ericwbailey
             Maintainer: @ericwbailey
             Based on the Tomorrow Night Eighties theme: https://github.com/isagalaev/highlight.js/blob/master/src/styles/tomorrow-night-eighties.css
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#545454;}.hljs-comment{color:#696969;}.hljs-quote{color:#696969;}.hljs-deletion{color:#d91e18;}.hljs-name{color:#d91e18;}.hljs-regexp{color:#d91e18;}.hljs-selector-class{color:#d91e18;}.hljs-selector-id{color:#d91e18;}.hljs-tag{color:#d91e18;}.hljs-template-variable{color:#d91e18;}.hljs-variable{color:#d91e18;}.hljs-attribute{color:#aa5d00;}.hljs-built_in{color:#aa5d00;}.hljs-link{color:#aa5d00;}.hljs-literal{color:#aa5d00;}.hljs-meta{color:#aa5d00;}.hljs-number{color:#aa5d00;}.hljs-params{color:#aa5d00;}.hljs-type{color:#aa5d00;}.hljs-addition{color:green;}.hljs-bullet{color:green;}.hljs-string{color:green;}.hljs-symbol{color:green;}.hljs-section{color:#007faa;}hljs-class-hljs-title{color:#007faa;}.hljs-keyword{color:#7928a1;}.hljs-selector-tag{color:#7928a1;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}.hljs-addition{color:highlight;}.hljs-attribute{color:highlight;}.hljs-built_in{color:highlight;}.hljs-bullet{color:highlight;}.hljs-comment{color:highlight;}.hljs-link{color:highlight;}.hljs-literal{color:highlight;}.hljs-meta{color:highlight;}.hljs-number{color:highlight;}.hljs-params{color:highlight;}.hljs-quote{color:highlight;}.hljs-string{color:highlight;}.hljs-symbol{color:highlight;}.hljs-type{color:highlight;}.hljs-keyword{font-weight:700;}.hljs-selector-tag{font-weight:700;}"
        case .atomOne:
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#383a42;}.hljs-comment{color:#a0a1a7;font-style:italic;}.hljs-quote{color:#a0a1a7;font-style:italic;}.hljs-doctag{color:#a626a4;}.hljs-formula{color:#a626a4;}.hljs-keyword{color:#a626a4;}.hljs-deletion{color:#e45649;}.hljs-name{color:#e45649;}.hljs-section{color:#e45649;}.hljs-selector-tag{color:#e45649;}.hljs-subst{color:#e45649;}.hljs-literal{color:#0184bb;}.hljs-addition{color:#50a14f;}.hljs-attribute{color:#50a14f;}.hljs-meta{color:#50a14f;}.hljs-string{color:#50a14f;}.hljs-regexp{color:#50a14f;}.hljs-string{color:#50a14f;}.hljs-attr{color:#986801;}.hljs-number{color:#986801;}.hljs-selector-attr{color:#986801;}.hljs-selector-class{color:#986801;}.hljs-selector-pseudo{color:#986801;}.hljs-template-variable{color:#986801;}.hljs-type{color:#986801;}.hljs-variable{color:#986801;}.hljs-bullet{color:#4078f2;}.hljs-link{color:#4078f2;}.hljs-meta{color:#4078f2;}.hljs-selector-id{color:#4078f2;}.hljs-symbol{color:#4078f2;}hljs-class-hljs-title{color:#4078f2;}.class_{color:#c18401;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}.hljs-link{text-decoration:underline;}"
        case .classic:
            /*
             Theme: Classic Light
             Author: Jason Heeris (http://heeris.id.au)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;padding:1em;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#303030;}.hljs-comment{color:#b0b0b0;}.hljs-tag{color:#505050;}.hljs-operator{color:#303030;}.hljs-punctuation{color:#303030;}.hljs-subst{color:#303030;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ac4142;}.hljs-deletion{color:#ac4142;}.hljs-name{color:#ac4142;}.hljs-selector-tag{color:#ac4142;}.hljs-template-variable{color:#ac4142;}.hljs-variable{color:#ac4142;}.constant_{color:#d28445;}.class_{color:#f4bf75;}.hljs-strong{color:#f4bf75;font-weight:700;}.inherited__{color:#90a959;}.hljs-atrule{color:#75b5aa;}.hljs-quote{color:#75b5aa;}.hljs-regexp{color:#75b5aa;}.function_{color:#6a9fb5;}.ruby{color:#6a9fb5;}.hljs-property{color:#6a9fb5;}.diff{color:#aa759f;}.hljs-meta{color:#aa759f;}.hljs-keyword{color:#aa759f;}.hljs-template-tag{color:#aa759f;}.hljs-type{color:#aa759f;}.hljs-emphasis{color:#aa759f;font-style:italic;}.hljs-meta{color:#8f5536;}.hljs-meta{color:#8f5536;}.hljs-keyword{color:#8f5536;}.hljs-meta{color:#8f5536;}.hljs-string{color:#8f5536;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .edge:
            /*
             Theme: Edge Light
             Author: cjayross (https://github.com/cjayross)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#5e646f;}.hljs-comment{color:#5e646f;}.hljs-tag{color:#6587bf;}.hljs-operator{color:#5e646f;}.hljs-punctuation{color:#5e646f;}.hljs-subst{color:#5e646f;}.hljs-operator{opacity:.7;}.constant_{color:#db7070;}.class_{color:#d69822;}.hljs-strong{font-weight:700;color:#d69822;}.inherited__{color:#7c9f4b;}.hljs-atrule{color:#509c93;}.hljs-quote{color:#509c93;}.hljs-regexp{color:#509c93;}.function_{color:#6587bf;}.ruby{color:#6587bf;}.hljs-property{color:#6587bf;}.diff{color:#b870ce;}.hljs-meta{color:#b870ce;}.hljs-keyword{color:#b870ce;}.hljs-template-tag{color:#b870ce;}.hljs-type{color:#b870ce;}.hljs-emphasis{font-style:italic;color:#b870ce;}.hljs-meta{color:#509c93;}.hljs-meta{color:#509c93;}.hljs-keyword{color:#509c93;}.hljs-meta{color:#509c93;}.hljs-string{color:#509c93;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .github:
            /*
             Theme: GitHub
             Description: Light theme as seen on github.com
             Author: github.com
             Maintainer: @Hirse
             Updated: 2021-05-15

             Outdated base version: https://github.com/primer/github-syntax-light
             Current colors taken from GitHub's CSS
             */
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#24292e;}.language_{color:#d73a49;}.function_{color:#6f42c1;}.hljs-attr{color:#005cc5;}.hljs-attribute{color:#005cc5;}.hljs-literal{color:#005cc5;}.hljs-meta{color:#005cc5;}.hljs-number{color:#005cc5;}.hljs-operator{color:#005cc5;}.hljs-selector-attr{color:#005cc5;}.hljs-selector-class{color:#005cc5;}.hljs-selector-id{color:#005cc5;}.hljs-variable{color:#005cc5;}.hljs-meta{color:#032f62;}.hljs-string{color:#032f62;}.hljs-regexp{color:#032f62;}.hljs-string{color:#032f62;}.hljs-built_in{color:#e36209;}.hljs-symbol{color:#e36209;}.hljs-code{color:#6a737d;}.hljs-comment{color:#6a737d;}.hljs-formula{color:#6a737d;}.hljs-name{color:#22863a;}.hljs-quote{color:#22863a;}.hljs-selector-pseudo{color:#22863a;}.hljs-selector-tag{color:#22863a;}.hljs-subst{color:#24292e;}.hljs-section{font-weight:700;color:#005cc5;}.hljs-bullet{color:#735c0f;}.hljs-emphasis{font-style:italic;color:#24292e;}.hljs-strong{font-weight:700;color:#24292e;}.hljs-addition{background-color:#f0fff4;color:#22863a;}.hljs-deletion{background-color:#ffeef0;color:#b31d28;}"
        case .google:
            /*
             Theme: Google Light
             Author: Seth Wright (http://sethawright.com)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#373b41;}.hljs-comment{color:#b4b7b4;}.hljs-tag{color:#969896;}.hljs-operator{color:#373b41;}.hljs-punctuation{color:#373b41;}.hljs-subst{color:#373b41;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#cc342b;}.hljs-deletion{color:#cc342b;}.hljs-name{color:#cc342b;}.hljs-selector-tag{color:#cc342b;}.hljs-template-variable{color:#cc342b;}.hljs-variable{color:#cc342b;}.constant_{color:#f96a38;}.class_{color:#fba922;}.hljs-strong{font-weight:700;color:#fba922;}.inherited__{color:#198844;}.function_{color:#3971ed;}.ruby{color:#3971ed;}.hljs-property{color:#3971ed;}.diff{color:#a36ac7;}.hljs-meta{color:#a36ac7;}.hljs-keyword{color:#a36ac7;}.hljs-template-tag{color:#a36ac7;}.hljs-type{color:#a36ac7;}.hljs-emphasis{color:#a36ac7;font-style:italic;}.hljs-meta{color:#3971ed;}.hljs-meta{color:#3971ed;}.hljs-keyword{color:#3971ed;}.hljs-meta{color:#3971ed;}.hljs-string{color:#3971ed;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .gradient:
            return ".hljs{display:block;padding:1em;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{background-image:linear-gradient(295deg,#f9ccff 0,#e6bbf9 11%,#9ec6f9 32%,#55e6ee 60%,#91f5d1 74%,#f9ffbf 98%);color:#250482;}.hljs-subtr{color:#01958b;}.hljs-comment{color:#cb7200;}.hljs-doctag{color:#cb7200;}.hljs-meta{color:#cb7200;}.hljs-quote{color:#cb7200;}.hljs-attr{color:#07bd5f;}.hljs-regexp{color:#07bd5f;}.hljs-selector-id{color:#07bd5f;}.hljs-selector-tag{color:#07bd5f;}.hljs-tag{color:#07bd5f;}.hljs-template-tag{color:#07bd5f;}.hljs-bullet{color:#43449f;}.hljs-params{color:#43449f;}.hljs-selector-class{color:#43449f;}.hljs-keyword{color:#7d2801;}.hljs-meta{color:#7d2801;}.hljs-keyword{color:#7d2801;}.hljs-section{color:#7d2801;}.hljs-symbol{color:#7d2801;}.hljs-type{color:#7d2801;}.hljs-addition{color:#7f0096;}.hljs-link{color:#7f0096;}.hljs-number{color:#7f0096;}.hljs-string{color:#2681ab;}.hljs-addition{color:#296562;}.hljs-attribute{color:#296562;}.hljs-template-variable{color:#025c8f;}.hljs-variable{color:#025c8f;}.hljs-built_in{color:#529117;}.hljs-class{color:#529117;}.hljs-formula{color:#529117;}.hljs-function{color:#529117;}.hljs-name{color:#529117;}hljs-class-hljs-title{color:#529117;}.hljs-deletion{color:#ad13ff;}.hljs-literal{color:#ad13ff;}.hljs-selector-pseudo{color:#ad13ff;}.hljs-emphasis{font-style:italic;}.hljs-quote{font-style:italic;}.hljs-keyword{font-weight:700;}.hljs-params{font-weight:700;}.hljs-section{font-weight:700;}.hljs-selector-class{font-weight:700;}.hljs-selector-id{font-weight:700;}.hljs-selector-tag{font-weight:700;}.hljs-strong{font-weight:700;}.hljs-template-tag{font-weight:700;}"
        case .grayscale:
            /*
             Theme: Grayscale Light
             Author: Alexandre Gavioli (https://github.com/Alexx2/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#464646;}.hljs-comment{color:#ababab;}.hljs-tag{color:#525252;}.hljs-operator{color:#464646;}.hljs-punctuation{color:#464646;}.hljs-subst{color:#464646;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#7c7c7c;}.hljs-deletion{color:#7c7c7c;}.hljs-name{color:#7c7c7c;}.hljs-selector-tag{color:#7c7c7c;}.hljs-template-variable{color:#7c7c7c;}.hljs-variable{color:#7c7c7c;}.constant_{color:#999;}.class_{color:#a0a0a0;}.hljs-strong{font-weight:700;color:#a0a0a0;}.inherited__{color:#8e8e8e;}.hljs-atrule{color:#868686;}.hljs-quote{color:#868686;}.hljs-regexp{color:#868686;}.function_{color:#686868;}.ruby{color:#686868;}.hljs-property{color:#686868;}.diff{color:#747474;}.hljs-meta{color:#747474;}.hljs-keyword{color:#747474;}.hljs-template-tag{color:#747474;}.hljs-type{color:#747474;}.hljs-emphasis{font-style:italic;color:#747474;}.hljs-meta{color:#5e5e5e;}.hljs-meta{color:#5e5e5e;}.hljs-keyword{color:#5e5e5e;}.hljs-meta{color:#5e5e5e;}.hljs-string{color:#5e5e5e;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .harmonic16:
            /*
             Theme: Harmonic16 Light
             Author: Jannik Siebert (https://github.com/janniks)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#405c79;}.hljs-comment{color:#aabcce;}.hljs-tag{color:#627e99;}.hljs-operator{color:#405c79;}.hljs-punctuation{color:#405c79;}.hljs-subst{color:#405c79;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#bf8b56;}.hljs-deletion{color:#bf8b56;}.hljs-name{color:#bf8b56;}.hljs-selector-tag{color:#bf8b56;}.hljs-template-variable{color:#bf8b56;}.hljs-variable{color:#bf8b56;}.constant_{color:#bfbf56;}.class_{color:#8bbf56;}.hljs-strong{font-weight:700;color:#8bbf56;}.inherited__{color:#56bf8b;}.hljs-atrule{color:#568bbf;}.hljs-quote{color:#568bbf;}.hljs-regexp{color:#568bbf;}.function_{color:#8b56bf;}.ruby{color:#8b56bf;}.hljs-property{color:#8b56bf;}.diff{color:#bf568b;}.hljs-meta{color:#bf568b;}.hljs-keyword{color:#bf568b;}.hljs-template-tag{color:#bf568b;}.hljs-type{color:#bf568b;}.hljs-emphasis{color:#bf568b;font-style:italic;}.hljs-meta{color:#bf5656;}.hljs-meta{color:#bf5656;}.hljs-keyword{color:#bf5656;}.hljs-meta{color:#bf5656;}.hljs-string{color:#bf5656;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .heetch:
            /*
             Theme: Heetch Light
             Author: Geoffrey Teale (tealeg@gmail.com)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#5a496e;}.hljs-comment{color:#9c92a8;}.hljs-tag{color:#ddd6e5;}.hljs-operator{color:#5a496e;}.hljs-punctuation{color:#5a496e;}.hljs-subst{color:#5a496e;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#27d9d5;}.hljs-deletion{color:#27d9d5;}.hljs-name{color:#27d9d5;}.hljs-selector-tag{color:#27d9d5;}.hljs-template-variable{color:#27d9d5;}.hljs-variable{color:#27d9d5;}.constant_{color:#bdb6c5;}.class_{color:#5ba2b6;}.hljs-strong{font-weight:700;color:#5ba2b6;}.inherited__{color:#f80059;}.hljs-atrule{color:#c33678;}.hljs-quote{color:#c33678;}.hljs-regexp{color:#c33678;}.function_{color:#47f9f5;}.ruby{color:#47f9f5;}.hljs-property{color:#47f9f5;}.diff{color:#bd0152;}.hljs-meta{color:#bd0152;}.hljs-keyword{color:#bd0152;}.hljs-template-tag{color:#bd0152;}.hljs-type{color:#bd0152;}.hljs-emphasis{font-style:italic;color:#bd0152;}.hljs-meta{color:#dedae2;}.hljs-meta{color:#dedae2;}.hljs-keyword{color:#dedae2;}.hljs-meta{color:#dedae2;}.hljs-string{color:#dedae2;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .horizon:
            /*
             Theme: Horizon Light
             Author: Michaël Ball (http://github.com/michael-ball/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#403c3d;}.hljs-comment{color:#bdb3b1;}.hljs-tag{color:#948c8a;}.hljs-operator{color:#403c3d;}.hljs-punctuation{color:#403c3d;}.hljs-subst{color:#403c3d;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#e95678;}.hljs-deletion{color:#e95678;}.hljs-name{color:#e95678;}.hljs-selector-tag{color:#e95678;}.hljs-template-variable{color:#e95678;}.hljs-variable{color:#e95678;}.constant_{color:#f9cec3;}.class_{color:#fadad1;}.hljs-strong{color:#fadad1;font-weight:700;}.inherited__{color:#29d398;}.hljs-atrule{color:#59e1e3;}.hljs-quote{color:#59e1e3;}.hljs-regexp{color:#59e1e3;}.function_{color:#26bbd9;}.ruby{color:#26bbd9;}.hljs-property{color:#26bbd9;}.diff{color:#ee64ac;}.hljs-meta{color:#ee64ac;}.hljs-keyword{color:#ee64ac;}.hljs-template-tag{color:#ee64ac;}.hljs-type{color:#ee64ac;}.hljs-emphasis{color:#ee64ac;font-style:italic;}.hljs-meta{color:#f9cbbe;}.hljs-meta{color:#f9cbbe;}.hljs-keyword{color:#f9cbbe;}.hljs-meta{color:#f9cbbe;}.hljs-string{color:#f9cbbe;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .humanoid:
            /*
             Theme: Humanoid light
             Author: Thomas (tasmo) Friese
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#232629;}.hljs-comment{color:#c0c0bd;}.hljs-tag{color:#60615d;}.hljs-operator{color:#232629;}.hljs-punctuation{color:#232629;}.hljs-subst{color:#232629;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#b0151a;}.hljs-deletion{color:#b0151a;}.hljs-name{color:#b0151a;}.hljs-selector-tag{color:#b0151a;}.hljs-template-variable{color:#b0151a;}.hljs-variable{color:#b0151a;}.constant_{color:#ff3d00;}.class_{color:#ffb627;}.hljs-strong{color:#ffb627;font-weight:700;}.inherited__{color:#388e3c;}.hljs-atrule{color:#008e8e;}.hljs-quote{color:#008e8e;}.hljs-regexp{color:#008e8e;}.function_{color:#0082c9;}.ruby{color:#0082c9;}.hljs-property{color:#0082c9;}.diff{color:#700f98;}.hljs-meta{color:#700f98;}.hljs-keyword{color:#700f98;}.hljs-template-tag{color:#700f98;}.hljs-type{color:#700f98;}.hljs-emphasis{font-style:italic;color:#700f98;}.hljs-meta{color:#b27701;}.hljs-meta{color:#b27701;}.hljs-keyword{color:#b27701;}.hljs-meta{color:#b27701;}.hljs-string{color:#b27701;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .ia:
            /*
             Theme: iA Light
             Author: iA Inc. (modified by aramisgithub)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#181818;}.hljs-comment{color:#898989;}.hljs-tag{color:#767676;}.hljs-operator{color:#181818;}.hljs-punctuation{color:#181818;}.hljs-subst{color:#181818;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#9c5a02;}.hljs-deletion{color:#9c5a02;}.hljs-name{color:#9c5a02;}.hljs-selector-tag{color:#9c5a02;}.hljs-template-variable{color:#9c5a02;}.hljs-variable{color:#9c5a02;}.constant_{color:#c43e18;}.class_{color:#c48218;}.hljs-strong{color:#c48218;font-weight:700;}.inherited__{color:#38781c;}.hljs-atrule{color:#2d6bb1;}.hljs-quote{color:#2d6bb1;}.hljs-regexp{color:#2d6bb1;}.function_{color:#48bac2;}.ruby{color:#48bac2;}.hljs-property{color:#48bac2;}.diff{color:#a94598;}.hljs-meta{color:#a94598;}.hljs-keyword{color:#a94598;}.hljs-template-tag{color:#a94598;}.hljs-type{color:#a94598;}.hljs-emphasis{color:#a94598;font-style:italic;}.hljs-meta{color:#8b6c37;}.hljs-meta{color:#8b6c37;}.hljs-keyword{color:#8b6c37;}.hljs-meta{color:#8b6c37;}.hljs-string{color:#8b6c37;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .isblEditor:
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#000;}.hljs-subst{color:#000;}.hljs-comment{font-style:italic;color:#555;}.hljs-attribute{color:#000;font-weight:700;}.hljs-doctag{color:#000;font-weight:700;}.hljs-keyword{color:#000;font-weight:700;}.hljs-meta{color:#000;font-weight:700;}.hljs-keyword{color:#000;font-weight:700;}.hljs-name{color:#000;font-weight:700;}.hljs-selector-tag{color:#000;font-weight:700;}.hljs-string{color:navy;}.hljs-deletion{color:#000;}.hljs-number{color:#000;}.hljs-quote{color:#000;}.hljs-selector-class{color:#000;}.hljs-selector-id{color:#000;}.hljs-template-tag{color:#000;}.hljs-type{color:#000;}.hljs-link{color:#5e1700;}.hljs-regexp{color:#5e1700;}.hljs-selector-attr{color:#5e1700;}.hljs-selector-pseudo{color:#5e1700;}.hljs-symbol{color:#5e1700;}.hljs-template-variable{color:#5e1700;}.hljs-variable{color:#5e1700;}.hljs-built_in{color:navy;font-weight:700;}.hljs-literal{color:navy;font-weight:700;}.hljs-addition{color:#397300;}.hljs-bullet{color:#397300;}.hljs-code{color:#397300;}.hljs-class{color:#6f1c00;font-weight:700;}.hljs-section{color:#fb2c00;}hljs-class-hljs-title{color:#fb2c00;}.hljs-built_in{color:teal;font-weight:400;}.hljs-meta{color:#1f7199;}.hljs-meta{color:#4d99bf;}.hljs-string{color:#4d99bf;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .kimbie:
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#84613d;}.hljs-comment{color:#a57a4c;}.hljs-quote{color:#a57a4c;}.hljs-meta{color:#dc3958;}.hljs-name{color:#dc3958;}.hljs-regexp{color:#dc3958;}.hljs-selector-class{color:#dc3958;}.hljs-selector-id{color:#dc3958;}.hljs-tag{color:#dc3958;}.hljs-template-variable{color:#dc3958;}.hljs-variable{color:#dc3958;}.hljs-built_in{color:#f79a32;}.hljs-deletion{color:#f79a32;}.hljs-link{color:#f79a32;}.hljs-literal{color:#f79a32;}.hljs-number{color:#f79a32;}.hljs-params{color:#f79a32;}.hljs-type{color:#f79a32;}.hljs-addition{color:#889b4a;}.hljs-bullet{color:#889b4a;}.hljs-string{color:#889b4a;}.hljs-symbol{color:#889b4a;}.hljs-function{color:#98676a;}.hljs-keyword{color:#98676a;}.hljs-selector-tag{color:#98676a;}.hljs-attribute{color:#f06431;}.hljs-section{color:#f06431;}hljs-class-hljs-title{color:#f06431;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .nnfx:
            /*
             Theme: nnfx light
             Description: a theme inspired by Netscape Navigator/Firefox
             Author: (c) 2020-2021 Jim Mason <jmason@ibinx.com>
             Maintainer: @RocketMan
             License: https://creativecommons.org/licenses/by-sa/4.0  CC BY-SA 4.0
             Updated: 2021-05-17

             @version 1.1.0
             */
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#000;}.language-xml{font-style:italic;color:#48b;font-weight:700;}.hljs-meta{font-style:italic;color:#48b;font-weight:700;}.language-xml{font-style:italic;color:#48b;font-weight:700;}.hljs-meta-string{font-style:italic;color:#48b;font-weight:700;}.hljs-comment{font-style:italic;color:#070;}.hljs-quote{font-style:italic;color:#070;}.hljs-built_in{color:#808;}.hljs-keyword{color:#808;}.hljs-name{color:#808;}.hljs-attr{font-weight:700;}.hljs-name{font-weight:700;}.hljs-string{font-weight:400;}.hljs-code{color:#00f;}.hljs-link{color:#00f;}.hljs-meta{color:#00f;}.hljs-string{color:#00f;}.hljs-number{color:#00f;}.hljs-regexp{color:#00f;}.hljs-string{color:#00f;}.hljs-bullet{color:#f40;}.hljs-symbol{color:#f40;}.hljs-template-variable{color:#f40;}hljs-class-hljs-title{color:#f40;}.hljs-variable{color:#f40;}.class_{color:#639;font-weight:700;}.hljs-type{color:#639;font-weight:700;}.function_{color:#000;}.hljs-formula{background-color:#eee;font-style:italic;}.hljs-addition{background-color:#beb;}.hljs-deletion{background-color:#fbb;}.hljs-meta{color:#269;}.hljs-section{color:#48b;font-weight:700;}.hljs-selector-class{color:#48b;font-weight:700;}.hljs-selector-id{color:#48b;font-weight:700;}.hljs-selector-pseudo{color:#48b;font-weight:700;}.hljs-selector-tag{color:#48b;font-weight:700;}.hljs-selector-pseudo{font-style:italic;}.hljs-doctag{font-weight:700;}.hljs-strong{font-weight:700;}.hljs-emphasis{font-style:italic;}"
        case .pandaSyntax:
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#2a2c2d;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}.hljs-link{text-decoration:underline;}.hljs-comment{color:#676b79;font-style:italic;}.hljs-quote{color:#676b79;font-style:italic;}.hljs-params{color:#676b79;}.hljs-attr{color:#2a2c2d;}.hljs-punctuation{color:#2a2c2d;}.escape_{color:#c56200;}.hljs-meta{color:#c56200;}.hljs-name{color:#c56200;}.hljs-operator{color:#c56200;}.hljs-selector-tag{color:#c56200;}.hljs-deletion{color:#d92792;}.hljs-keyword{color:#d92792;}.language_{color:#cc5e91;}.function_{color:#3787c7;}.inherited__{color:#0d7d6c;}.hljs-attribute{color:#7641bb;}.hljs-built_in{color:#7641bb;}.hljs-doctag{color:#7641bb;}.hljs-link{color:#7641bb;}.hljs-literal{color:#7641bb;}.hljs-meta{color:#7641bb;}.hljs-keyword{color:#7641bb;}.hljs-number{color:#7641bb;}.hljs-selector-id{color:#7641bb;}.hljs-tag{color:#7641bb;}.hljs-template-tag{color:#7641bb;}.hljs-template-variable{color:#7641bb;}hljs-class-hljs-title{color:#7641bb;}.hljs-type{color:#7641bb;}.hljs-variable{color:#7641bb;}"
        case .papercolor:
            /*
             Theme: PaperColor Light
             Author: Jon Leopard (http://github.com/jonleopard) based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#444;}.hljs-comment{color:#5f8700;}.hljs-tag{color:#0087af;}.hljs-operator{color:#444;}.hljs-punctuation{color:#444;}.hljs-subst{color:#444;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#bcbcbc;}.hljs-deletion{color:#bcbcbc;}.hljs-name{color:#bcbcbc;}.hljs-selector-tag{color:#bcbcbc;}.hljs-template-variable{color:#bcbcbc;}.hljs-variable{color:#bcbcbc;}.constant_{color:#d70000;}.class_{color:#d70087;}.hljs-strong{font-weight:700;color:#d70087;}.inherited__{color:#8700af;}.function_{color:#d75f00;}.ruby{color:#d75f00;}.hljs-property{color:#d75f00;}.diff{color:#005faf;}.hljs-meta{color:#005faf;}.hljs-keyword{color:#005faf;}.hljs-template-tag{color:#005faf;}.hljs-type{color:#005faf;}.hljs-emphasis{color:#005faf;font-style:italic;}.hljs-meta{color:#005f87;}.hljs-meta{color:#005f87;}.hljs-keyword{color:#005f87;}.hljs-meta{color:#005f87;}.hljs-string{color:#005f87;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .paraiso:
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#4f424c;}.hljs-comment{color:#776e71;}.hljs-quote{color:#776e71;}.hljs-link{color:#ef6155;}.hljs-meta{color:#ef6155;}.hljs-name{color:#ef6155;}.hljs-regexp{color:#ef6155;}.hljs-selector-class{color:#ef6155;}.hljs-selector-id{color:#ef6155;}.hljs-tag{color:#ef6155;}.hljs-template-variable{color:#ef6155;}.hljs-variable{color:#ef6155;}.hljs-built_in{color:#f99b15;}.hljs-deletion{color:#f99b15;}.hljs-literal{color:#f99b15;}.hljs-number{color:#f99b15;}.hljs-params{color:#f99b15;}.hljs-type{color:#f99b15;}.hljs-attribute{color:#fec418;}.hljs-section{color:#fec418;}hljs-class-hljs-title{color:#fec418;}.hljs-addition{color:#48b685;}.hljs-bullet{color:#48b685;}.hljs-string{color:#48b685;}.hljs-symbol{color:#48b685;}.hljs-keyword{color:#815ba4;}.hljs-selector-tag{color:#815ba4;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .qtcreator:
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#000;}.hljs-emphasis{color:#000;}.hljs-strong{color:#000;}.hljs-bullet{color:navy;}.hljs-literal{color:navy;}.hljs-number{color:navy;}.hljs-quote{color:navy;}.hljs-regexp{color:navy;}.hljs-code{color:purple;}.hljs-selector-class{color:purple;}.hljs-emphasis{font-style:italic;}.hljs-stronge{font-style:italic;}.hljs-type{font-style:italic;}.hljs-function{color:olive;}.hljs-keyword{color:olive;}.hljs-name{color:olive;}.hljs-section{color:olive;}.hljs-selector-tag{color:olive;}.hljs-symbol{color:olive;}.hljs-subst{color:#000;}.hljs-tag{color:#000;}hljs-class-hljs-title{color:#000;}.hljs-attribute{color:maroon;}.class_{color:#0055af;}.hljs-variable{color:#0055af;}.hljs-addition{color:green;}.hljs-built_in{color:green;}.hljs-comment{color:green;}.hljs-deletion{color:green;}.hljs-link{color:green;}.hljs-meta{color:green;}.hljs-selector-attr{color:green;}.hljs-selector-id{color:green;}.hljs-selector-pseudo{color:green;}.hljs-string{color:green;}.hljs-template-tag{color:green;}.hljs-template-variable{color:green;}.hljs-type{color:green;}"
        case .silk:
            /*
             Theme: Silk Light
             Author: Gabriel Fontes (https://github.com/Misterio77)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#385156;}.hljs-comment{color:#5c787b;}.hljs-tag{color:#4b5b5f;}.hljs-operator{color:#385156;}.hljs-punctuation{color:#385156;}.hljs-subst{color:#385156;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#cf432e;}.hljs-deletion{color:#cf432e;}.hljs-name{color:#cf432e;}.hljs-selector-tag{color:#cf432e;}.hljs-template-variable{color:#cf432e;}.hljs-variable{color:#cf432e;}.constant_{color:#d27f46;}.class_{color:#cfad25;}.hljs-strong{font-weight:700;color:#cfad25;}.inherited__{color:#6ca38c;}.hljs-atrule{color:#329ca2;}.hljs-quote{color:#329ca2;}.hljs-regexp{color:#329ca2;}.function_{color:#39aac9;}.ruby{color:#39aac9;}.hljs-property{color:#39aac9;}.diff{color:#6e6582;}.hljs-meta{color:#6e6582;}.hljs-keyword{color:#6e6582;}.hljs-template-tag{color:#6e6582;}.hljs-type{color:#6e6582;}.hljs-emphasis{color:#6e6582;font-style:italic;}.hljs-meta{color:#865369;}.hljs-meta{color:#865369;}.hljs-keyword{color:#865369;}.hljs-meta{color:#865369;}.hljs-string{color:#865369;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .solarFlare:
            /*
             Theme: Solar Flare Light
             Author: Chuck Harmston (https://chuck.harmston.ch)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#586875;}.hljs-comment{color:#85939e;}.hljs-tag{color:#667581;}.hljs-operator{color:#586875;}.hljs-punctuation{color:#586875;}.hljs-subst{color:#586875;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ef5253;}.hljs-deletion{color:#ef5253;}.hljs-name{color:#ef5253;}.hljs-selector-tag{color:#ef5253;}.hljs-template-variable{color:#ef5253;}.hljs-variable{color:#ef5253;}.constant_{color:#e66b2b;}.class_{color:#e4b51c;}.hljs-strong{color:#e4b51c;font-weight:700;}.inherited__{color:#7cc844;}.hljs-atrule{color:#52cbb0;}.hljs-quote{color:#52cbb0;}.hljs-regexp{color:#52cbb0;}.function_{color:#33b5e1;}.ruby{color:#33b5e1;}.hljs-property{color:#33b5e1;}.diff{color:#a363d5;}.hljs-meta{color:#a363d5;}.hljs-keyword{color:#a363d5;}.hljs-template-tag{color:#a363d5;}.hljs-type{color:#a363d5;}.hljs-emphasis{color:#a363d5;font-style:italic;}.hljs-meta{color:#d73c9a;}.hljs-meta{color:#d73c9a;}.hljs-keyword{color:#d73c9a;}.hljs-meta{color:#d73c9a;}.hljs-string{color:#d73c9a;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .solarized:
            /*
             Theme: Solarized Light
             Author: Ethan Schoonover (modified by aramisgithub)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#586e75;}.hljs-comment{color:#839496;}.hljs-tag{color:#657b83;}.hljs-operator{color:#586e75;}.hljs-punctuation{color:#586e75;}.hljs-subst{color:#586e75;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#dc322f;}.hljs-deletion{color:#dc322f;}.hljs-name{color:#dc322f;}.hljs-selector-tag{color:#dc322f;}.hljs-template-variable{color:#dc322f;}.hljs-variable{color:#dc322f;}.constant_{color:#cb4b16;}.class_{color:#b58900;}.hljs-strong{font-weight:700;color:#b58900;}.inherited__{color:#859900;}.hljs-atrule{color:#2aa198;}.hljs-quote{color:#2aa198;}.hljs-regexp{color:#2aa198;}.function_{color:#268bd2;}.ruby{color:#268bd2;}.hljs-property{color:#268bd2;}.diff{color:#6c71c4;}.hljs-meta{color:#6c71c4;}.hljs-keyword{color:#6c71c4;}.hljs-template-tag{color:#6c71c4;}.hljs-type{color:#6c71c4;}.hljs-emphasis{color:#6c71c4;font-style:italic;}.hljs-meta{color:#d33682;}.hljs-meta{color:#d33682;}.hljs-keyword{color:#d33682;}.hljs-meta{color:#d33682;}.hljs-string{color:#d33682;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .stackoverflow:
            /*
             Theme: StackOverflow Light
             Description: Light theme as used on stackoverflow.com
             Author: stackoverflow.com
             Maintainer: @Hirse
             Website: https://github.com/StackExchange/Stacks
             License: MIT
             Updated: 2021-05-15

             Updated for @stackoverflow/stacks v0.64.0
             Code Blocks: /blob/v0.64.0/lib/css/components/_stacks-code-blocks.less
             Colors: /blob/v0.64.0/lib/css/exports/_stacks-constants-colors.less
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#2f3337;}.hljs-subst{color:#2f3337;}.hljs-comment{color:#656e77;}.hljs-attr{color:#015692;}.hljs-doctag{color:#015692;}.hljs-keyword{color:#015692;}.hljs-meta{color:#015692;}.hljs-keyword{color:#015692;}.hljs-section{color:#015692;}.hljs-selector-tag{color:#015692;}.hljs-attribute{color:#803378;}.hljs-name{color:#b75501;}.hljs-number{color:#b75501;}.hljs-quote{color:#b75501;}.hljs-selector-id{color:#b75501;}.hljs-template-tag{color:#b75501;}.hljs-type{color:#b75501;}.hljs-selector-class{color:#015692;}.hljs-link{color:#54790d;}.hljs-regexp{color:#54790d;}.hljs-selector-attr{color:#54790d;}.hljs-string{color:#54790d;}.hljs-symbol{color:#54790d;}.hljs-template-variable{color:#54790d;}.hljs-variable{color:#54790d;}.hljs-meta{color:#015692;}.hljs-selector-pseudo{color:#015692;}.hljs-built_in{color:#b75501;}.hljs-literal{color:#b75501;}hljs-class-hljs-title{color:#b75501;}.hljs-bullet{color:#535a60;}.hljs-code{color:#535a60;}.hljs-meta{color:#54790d;}.hljs-string{color:#54790d;}.hljs-deletion{color:#c02d2e;}.hljs-addition{color:#2f6f44;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .standard:
            /*
             Theme: Default Light
             Author: Chris Kempson (http://chriskempson.com)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#383838;}.hljs-comment{color:#b8b8b8;}.hljs-tag{color:#585858;}.hljs-operator{color:#383838;}.hljs-punctuation{color:#383838;}.hljs-subst{color:#383838;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ab4642;}.hljs-deletion{color:#ab4642;}.hljs-name{color:#ab4642;}.hljs-selector-tag{color:#ab4642;}.hljs-template-variable{color:#ab4642;}.hljs-variable{color:#ab4642;}.constant_{color:#dc9656;}.class_{color:#f7ca88;}.hljs-strong{font-weight:700;color:#f7ca88;}.inherited__{color:#a1b56c;}.hljs-atrule{color:#86c1b9;}.hljs-quote{color:#86c1b9;}.hljs-regexp{color:#86c1b9;}.function_{color:#7cafc2;}.ruby{color:#7cafc2;}.hljs-property{color:#7cafc2;}.diff{color:#ba8baf;}.hljs-meta{color:#ba8baf;}.hljs-keyword{color:#ba8baf;}.hljs-template-tag{color:#ba8baf;}.hljs-type{color:#ba8baf;}.hljs-emphasis{font-style:italic;color:#ba8baf;}.hljs-meta{color:#a16946;}.hljs-meta{color:#a16946;}.hljs-keyword{color:#a16946;}.hljs-meta{color:#a16946;}.hljs-string{color:#a16946;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .summerfruit:
            /*
             Theme: Summerfruit Light
             Author: Christopher Corley (http://christop.club/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#101010;}.hljs-comment{color:#b0b0b0;}.hljs-tag{color:#000;}.hljs-operator{color:#101010;}.hljs-punctuation{color:#101010;}.hljs-subst{color:#101010;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ff0086;}.hljs-deletion{color:#ff0086;}.hljs-name{color:#ff0086;}.hljs-selector-tag{color:#ff0086;}.hljs-template-variable{color:#ff0086;}.hljs-variable{color:#ff0086;}.constant_{color:#fd8900;}.class_{color:#aba800;}.hljs-strong{font-weight:700;color:#aba800;}.inherited__{color:#00c918;}.hljs-atrule{color:#1faaaa;}.hljs-quote{color:#1faaaa;}.hljs-regexp{color:#1faaaa;}.function_{color:#3777e6;}.ruby{color:#3777e6;}.hljs-property{color:#3777e6;}.diff{color:#ad00a1;}.hljs-meta{color:#ad00a1;}.hljs-keyword{color:#ad00a1;}.hljs-template-tag{color:#ad00a1;}.hljs-type{color:#ad00a1;}.hljs-emphasis{font-style:italic;color:#ad00a1;}.hljs-meta{color:#c63;}.hljs-meta{color:#c63;}.hljs-keyword{color:#c63;}.hljs-meta{color:#c63;}.hljs-string{color:#c63;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .synthMidnightTerminal:
            /*
             Theme: Synth Midnight Terminal Light
             Author: Michaël Ball (http://github.com/michael-ball/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#28292a;}.hljs-comment{color:#a3a5a6;}.hljs-tag{color:#474849;}.hljs-operator{color:#28292a;}.hljs-punctuation{color:#28292a;}.hljs-subst{color:#28292a;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#b53b50;}.hljs-deletion{color:#b53b50;}.hljs-name{color:#b53b50;}.hljs-selector-tag{color:#b53b50;}.hljs-template-variable{color:#b53b50;}.hljs-variable{color:#b53b50;}.constant_{color:#ea770d;}.class_{color:#c9d364;}.hljs-strong{font-weight:700;color:#c9d364;}.inherited__{color:#06ea61;}.hljs-atrule{color:#42fff9;}.hljs-quote{color:#42fff9;}.hljs-regexp{color:#42fff9;}.function_{color:#03aeff;}.ruby{color:#03aeff;}.hljs-property{color:#03aeff;}.diff{color:#ea5ce2;}.hljs-meta{color:#ea5ce2;}.hljs-keyword{color:#ea5ce2;}.hljs-template-tag{color:#ea5ce2;}.hljs-type{color:#ea5ce2;}.hljs-emphasis{font-style:italic;color:#ea5ce2;}.hljs-meta{color:#cd6320;}.hljs-meta{color:#cd6320;}.hljs-keyword{color:#cd6320;}.hljs-meta{color:#cd6320;}.hljs-string{color:#cd6320;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .tokyoNight:
            /*
             Theme: Tokyo-night-light
             origin: https://github.com/enkia/tokyo-night-vscode-theme
             Description: Original highlight.js style
             Author: (c) Henri Vandersleyen <hvandersleyen@gmail.com>
             License: see project LICENSE
             Touched: 2022
             */
            return ".hljs{display:block;padding:1em;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs-comment{color:#9699a3;}.hljs-meta{color:#9699a3;}.language_{color:#8c4351;}.hljs-link{color:#965027;}.hljs-literal{color:#965027;}.hljs-number{color:#965027;}.hljs-params{color:#965027;}.hljs-template-variable{color:#965027;}.hljs-type{color:#965027;}.hljs-variable{color:#965027;}.hljs-attribute{color:#8f5e15;}.hljs-built_in{color:#8f5e15;}.function_{color:#0f4b6e;}.hljs-selector-tag{color:#33635c;}.hljs-addition{color:#485e30;}.hljs-bullet{color:#485e30;}.hljs-quote{color:#485e30;}.hljs-string{color:#485e30;}.hljs-symbol{color:#485e30;}.hljs-code{color:#34548a;}.hljs-formula{color:#34548a;}.hljs-section{color:#34548a;}.escape_{color:#5a4a78;}.hljs-keyword{color:#5a4a78;}.hljs-name{color:#5a4a78;}.hljs-operator{color:#5a4a78;}.hljs-punctuation{color:#343b58;}.hljs{color:#565a6e;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .unikitty:
            /*
             Theme: Unikitty Light
             Author: Josh W Lewis (@joshwlewis)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#6c696e;}.hljs-comment{color:#a7a5a8;}.hljs-tag{color:#89878b;}.hljs-operator{color:#6c696e;}.hljs-punctuation{color:#6c696e;}.hljs-subst{color:#6c696e;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#d8137f;}.hljs-deletion{color:#d8137f;}.hljs-name{color:#d8137f;}.hljs-selector-tag{color:#d8137f;}.hljs-template-variable{color:#d8137f;}.hljs-variable{color:#d8137f;}.constant_{color:#d65407;}.class_{color:#dc8a0e;}.hljs-strong{font-weight:700;color:#dc8a0e;}.inherited__{color:#17ad98;}.hljs-atrule{color:#149bda;}.hljs-quote{color:#149bda;}.hljs-regexp{color:#149bda;}.function_{color:#775dff;}.ruby{color:#775dff;}.hljs-property{color:#775dff;}.diff{color:#aa17e6;}.hljs-meta{color:#aa17e6;}.hljs-keyword{color:#aa17e6;}.hljs-template-tag{color:#aa17e6;}.hljs-type{color:#aa17e6;}.hljs-emphasis{color:#aa17e6;font-style:italic;}.hljs-meta{color:#e013d0;}.hljs-meta{color:#e013d0;}.hljs-keyword{color:#e013d0;}.hljs-meta{color:#e013d0;}.hljs-string{color:#e013d0;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .xcode:
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#000;}.xml{color:silver;}.hljs-meta{color:silver;}.hljs-comment{color:#007400;}.hljs-quote{color:#007400;}.hljs-attribute{color:#aa0d91;}.hljs-keyword{color:#aa0d91;}.hljs-literal{color:#aa0d91;}.hljs-name{color:#aa0d91;}.hljs-selector-tag{color:#aa0d91;}.hljs-tag{color:#aa0d91;}.hljs-template-variable{color:#3f6e74;}.hljs-variable{color:#3f6e74;}.hljs-code{color:#c41a16;}.hljs-meta{color:#c41a16;}.hljs-string{color:#c41a16;}.hljs-string{color:#c41a16;}.hljs-link{color:#0e0eff;}.hljs-regexp{color:#0e0eff;}.hljs-bullet{color:#1c00cf;}.hljs-number{color:#1c00cf;}.hljs-symbol{color:#1c00cf;}hljs-class-hljs-title{color:#1c00cf;}.hljs-meta{color:#643820;}.hljs-section{color:#643820;}.class_{color:#5c2699;}.hljs-type{color:#5c2699;}.hljs-attr{color:#836c28;}.hljs-subst{color:#000;}.hljs-formula{background-color:#eee;font-style:italic;}.hljs-addition{background-color:#baeeba;}.hljs-deletion{background-color:#ffc8bd;}.hljs-selector-class{color:#9b703f;}.hljs-selector-id{color:#9b703f;}.hljs-doctag{font-weight:700;}.hljs-strong{font-weight:700;}.hljs-emphasis{font-style:italic;}"
        }
    }
    
    static func dark(_ name: HighlightStyle.Name) -> StaticString {
        switch name {
        case .a11y:
            /*
             Theme: a11y-dark
             Author: @ericwbailey
             Maintainer: @ericwbailey

             Based on the Tomorrow Night Eighties theme: https://github.com/isagalaev/highlight.js/blob/master/src/styles/tomorrow-night-eighties.css
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#f8f8f2;}.hljs-comment{color:#d4d0ab;}.hljs-quote{color:#d4d0ab;}.hljs-deletion{color:#ffa07a;}.hljs-name{color:#ffa07a;}.hljs-regexp{color:#ffa07a;}.hljs-selector-class{color:#ffa07a;}.hljs-selector-id{color:#ffa07a;}.hljs-tag{color:#ffa07a;}.hljs-template-variable{color:#ffa07a;}.hljs-variable{color:#ffa07a;}.hljs-built_in{color:#f5ab35;}.hljs-link{color:#f5ab35;}.hljs-literal{color:#f5ab35;}.hljs-meta{color:#f5ab35;}.hljs-number{color:#f5ab35;}.hljs-params{color:#f5ab35;}.hljs-type{color:#f5ab35;}.hljs-attribute{color:gold;}.hljs-addition{color:#abe338;}.hljs-bullet{color:#abe338;}.hljs-string{color:#abe338;}.hljs-symbol{color:#abe338;}.hljs-section{color:#00e0e0;}hljs-class-hljs-title{color:#00e0e0;}.hljs-keyword{color:#dcc6e0;}.hljs-selector-tag{color:#dcc6e0;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}.hljs-addition{color:highlight;}.hljs-attribute{color:highlight;}.hljs-built_in{color:highlight;}.hljs-bullet{color:highlight;}.hljs-comment{color:highlight;}.hljs-link{color:highlight;}.hljs-literal{color:highlight;}.hljs-meta{color:highlight;}.hljs-number{color:highlight;}.hljs-params{color:highlight;}.hljs-quote{color:highlight;}.hljs-string{color:highlight;}.hljs-symbol{color:highlight;}.hljs-type{color:highlight;}.hljs-keyword{font-weight:700;}.hljs-selector-tag{font-weight:700;}"
        case .atomOne:
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#abb2bf;}.hljs-comment{font-style:italic;color:#5c6370;}.hljs-quote{font-style:italic;color:#5c6370;}.hljs-doctag{color:#c678dd;}.hljs-formula{color:#c678dd;}.hljs-keyword{color:#c678dd;}.hljs-deletion{color:#e06c75;}.hljs-name{color:#e06c75;}.hljs-section{color:#e06c75;}.hljs-selector-tag{color:#e06c75;}.hljs-subst{color:#e06c75;}.hljs-literal{color:#56b6c2;}.hljs-addition{color:#98c379;}.hljs-attribute{color:#98c379;}.hljs-meta{color:#98c379;}.hljs-string{color:#98c379;}.hljs-regexp{color:#98c379;}.hljs-string{color:#98c379;}.hljs-attr{color:#d19a66;}.hljs-number{color:#d19a66;}.hljs-selector-attr{color:#d19a66;}.hljs-selector-class{color:#d19a66;}.hljs-selector-pseudo{color:#d19a66;}.hljs-template-variable{color:#d19a66;}.hljs-type{color:#d19a66;}.hljs-variable{color:#d19a66;}.hljs-bullet{color:#61aeee;}.hljs-link{color:#61aeee;}.hljs-meta{color:#61aeee;}.hljs-selector-id{color:#61aeee;}.hljs-symbol{color:#61aeee;}hljs-class-hljs-title{color:#61aeee;}.class_{color:#e6c07b;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}.hljs-link{text-decoration:underline;}"
        case .classic:
            /*
             Theme: Classic Dark
             Author: Jason Heeris (http://heeris.id.au)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#d0d0d0;}.hljs-comment{color:#505050;}.hljs-tag{color:#b0b0b0;}.hljs-operator{color:#d0d0d0;}.hljs-punctuation{color:#d0d0d0;}.hljs-subst{color:#d0d0d0;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ac4142;}.hljs-deletion{color:#ac4142;}.hljs-name{color:#ac4142;}.hljs-selector-tag{color:#ac4142;}.hljs-template-variable{color:#ac4142;}.hljs-variable{color:#ac4142;}.constant_{color:#d28445;}.class_{color:#f4bf75;}.hljs-strong{color:#f4bf75;font-weight:700;}.inherited__{color:#90a959;}.hljs-atrule{color:#75b5aa;}.hljs-quote{color:#75b5aa;}.hljs-regexp{color:#75b5aa;}.function_{color:#6a9fb5;}.ruby{color:#6a9fb5;}.hljs-property{color:#6a9fb5;}.diff{color:#aa759f;}.hljs-meta{color:#aa759f;}.hljs-keyword{color:#aa759f;}.hljs-template-tag{color:#aa759f;}.hljs-type{color:#aa759f;}.hljs-emphasis{color:#aa759f;font-style:italic;}.hljs-meta{color:#8f5536;}.hljs-meta{color:#8f5536;}.hljs-keyword{color:#8f5536;}.hljs-meta{color:#8f5536;}.hljs-string{color:#8f5536;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .edge:
            /*
             Theme: Edge Dark
             Author: cjayross (https://github.com/cjayross)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#b7bec9;}.hljs-comment{color:#3e4249;}.hljs-tag{color:#73b3e7;}.hljs-operator{color:#b7bec9;}.hljs-punctuation{color:#b7bec9;}.hljs-subst{color:#b7bec9;}.hljs-operator{opacity:.7;}.constant_{color:#e77171;}.class_{color:#dbb774;}.hljs-strong{font-weight:700;color:#dbb774;}.inherited__{color:#a1bf78;}.hljs-atrule{color:#5ebaa5;}.hljs-quote{color:#5ebaa5;}.hljs-regexp{color:#5ebaa5;}.function_{color:#73b3e7;}.ruby{color:#73b3e7;}.hljs-property{color:#73b3e7;}.diff{color:#d390e7;}.hljs-meta{color:#d390e7;}.hljs-keyword{color:#d390e7;}.hljs-template-tag{color:#d390e7;}.hljs-type{color:#d390e7;}.hljs-emphasis{color:#d390e7;font-style:italic;}.hljs-meta{color:#5ebaa5;}.hljs-meta{color:#5ebaa5;}.hljs-keyword{color:#5ebaa5;}.hljs-meta{color:#5ebaa5;}.hljs-string{color:#5ebaa5;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .github:
            /*
             Theme: GitHub Dark
             Description: Dark theme as seen on github.com
             Author: github.com
             Maintainer: @Hirse
             Updated: 2021-05-15

             Outdated base version: https://github.com/primer/github-syntax-dark
             Current colors taken from GitHub's CSS
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#c9d1d9;}.language_{color:#ff7b72;}.function_{color:#d2a8ff;}.hljs-attr{color:#79c0ff;}.hljs-attribute{color:#79c0ff;}.hljs-literal{color:#79c0ff;}.hljs-meta{color:#79c0ff;}.hljs-number{color:#79c0ff;}.hljs-operator{color:#79c0ff;}.hljs-selector-attr{color:#79c0ff;}.hljs-selector-class{color:#79c0ff;}.hljs-selector-id{color:#79c0ff;}.hljs-variable{color:#79c0ff;}.hljs-meta{color:#a5d6ff;}.hljs-string{color:#a5d6ff;}.hljs-regexp{color:#a5d6ff;}.hljs-string{color:#a5d6ff;}.hljs-built_in{color:#ffa657;}.hljs-symbol{color:#ffa657;}.hljs-code{color:#8b949e;}.hljs-comment{color:#8b949e;}.hljs-formula{color:#8b949e;}.hljs-name{color:#7ee787;}.hljs-quote{color:#7ee787;}.hljs-selector-pseudo{color:#7ee787;}.hljs-selector-tag{color:#7ee787;}.hljs-subst{color:#c9d1d9;}.hljs-section{color:#1f6feb;font-weight:700;}.hljs-bullet{color:#f2cc60;}.hljs-emphasis{color:#c9d1d9;font-style:italic;}.hljs-strong{color:#c9d1d9;font-weight:700;}.hljs-addition{color:#aff5b4;background-color:#033a16;}.hljs-deletion{color:#ffdcd7;background-color:#67060c;}"
        case .google:
            /*
             Theme: Google Dark
             Author: Seth Wright (http://sethawright.com)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#c5c8c6;}.hljs-comment{color:#969896;}.hljs-tag{color:#b4b7b4;}.hljs-operator{color:#c5c8c6;}.hljs-punctuation{color:#c5c8c6;}.hljs-subst{color:#c5c8c6;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#cc342b;}.hljs-deletion{color:#cc342b;}.hljs-name{color:#cc342b;}.hljs-selector-tag{color:#cc342b;}.hljs-template-variable{color:#cc342b;}.hljs-variable{color:#cc342b;}.constant_{color:#f96a38;}.class_{color:#fba922;}.hljs-strong{font-weight:700;color:#fba922;}.inherited__{color:#198844;}.function_{color:#3971ed;}.ruby{color:#3971ed;}.hljs-property{color:#3971ed;}.diff{color:#a36ac7;}.hljs-meta{color:#a36ac7;}.hljs-keyword{color:#a36ac7;}.hljs-template-tag{color:#a36ac7;}.hljs-type{color:#a36ac7;}.hljs-emphasis{color:#a36ac7;font-style:italic;}.hljs-meta{color:#3971ed;}.hljs-meta{color:#3971ed;}.hljs-keyword{color:#3971ed;}.hljs-meta{color:#3971ed;}.hljs-string{color:#3971ed;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .gradient:
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{background-image:linear-gradient(160deg,#652487 0,#443ac3 35%,#0174b7 68%,#04988e 100%);color:#e7e4eb;}.hljs-subtr{color:#e7e4eb;}.hljs-comment{color:#af8dd9;}.hljs-doctag{color:#af8dd9;}.hljs-meta{color:#af8dd9;}.hljs-quote{color:#af8dd9;}.hljs-attr{color:#aefbff;}.hljs-regexp{color:#aefbff;}.hljs-selector-id{color:#aefbff;}.hljs-selector-tag{color:#aefbff;}.hljs-tag{color:#aefbff;}.hljs-template-tag{color:#aefbff;}.hljs-bullet{color:#f19fff;}.hljs-params{color:#f19fff;}.hljs-selector-class{color:#f19fff;}.hljs-keyword{color:#17fc95;}.hljs-meta{color:#17fc95;}.hljs-keyword{color:#17fc95;}.hljs-section{color:#17fc95;}.hljs-symbol{color:#17fc95;}.hljs-type{color:#17fc95;}.hljs-addition{color:#c5fe00;}.hljs-link{color:#c5fe00;}.hljs-number{color:#c5fe00;}.hljs-string{color:#38c0ff;}.hljs-addition{color:#e7ff9f;}.hljs-attribute{color:#e7ff9f;}.hljs-template-variable{color:#e447ff;}.hljs-variable{color:#e447ff;}.hljs-built_in{color:#ffc800;}.hljs-class{color:#ffc800;}.hljs-formula{color:#ffc800;}.hljs-function{color:#ffc800;}.hljs-name{color:#ffc800;}hljs-class-hljs-title{color:#ffc800;}.hljs-deletion{color:#ff9e44;}.hljs-literal{color:#ff9e44;}.hljs-selector-pseudo{color:#ff9e44;}.hljs-emphasis{font-style:italic;}.hljs-quote{font-style:italic;}.hljs-keyword{font-weight:700;}.hljs-params{font-weight:700;}.hljs-section{font-weight:700;}.hljs-selector-class{font-weight:700;}.hljs-selector-id{font-weight:700;}.hljs-selector-tag{font-weight:700;}.hljs-strong{font-weight:700;}.hljs-template-tag{font-weight:700;}"
        case .grayscale:
            /*
             Theme: Grayscale Dark
             Author: Alexandre Gavioli (https://github.com/Alexx2/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#b9b9b9;}.hljs-comment{color:#525252;}.hljs-tag{color:#ababab;}.hljs-operator{color:#b9b9b9;}.hljs-punctuation{color:#b9b9b9;}.hljs-subst{color:#b9b9b9;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#7c7c7c;}.hljs-deletion{color:#7c7c7c;}.hljs-name{color:#7c7c7c;}.hljs-selector-tag{color:#7c7c7c;}.hljs-template-variable{color:#7c7c7c;}.hljs-variable{color:#7c7c7c;}.constant_{color:#999;}.class_{color:#a0a0a0;}.hljs-strong{font-weight:700;color:#a0a0a0;}.inherited__{color:#8e8e8e;}.hljs-atrule{color:#868686;}.hljs-quote{color:#868686;}.hljs-regexp{color:#868686;}.function_{color:#686868;}.ruby{color:#686868;}.hljs-property{color:#686868;}.diff{color:#747474;}.hljs-meta{color:#747474;}.hljs-keyword{color:#747474;}.hljs-template-tag{color:#747474;}.hljs-type{color:#747474;}.hljs-emphasis{font-style:italic;color:#747474;}.hljs-meta{color:#5e5e5e;}.hljs-meta{color:#5e5e5e;}.hljs-keyword{color:#5e5e5e;}.hljs-meta{color:#5e5e5e;}.hljs-string{color:#5e5e5e;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .harmonic16:
            /*
             Theme: Harmonic16 Dark
             Author: Jannik Siebert (https://github.com/janniks)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;padding:1em;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#cbd6e2;}.hljs-comment{color:#627e99;}.hljs-tag{color:#aabcce;}.hljs-operator{color:#cbd6e2;}.hljs-punctuation{color:#cbd6e2;}.hljs-subst{color:#cbd6e2;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#bf8b56;}.hljs-deletion{color:#bf8b56;}.hljs-name{color:#bf8b56;}.hljs-selector-tag{color:#bf8b56;}.hljs-template-variable{color:#bf8b56;}.hljs-variable{color:#bf8b56;}.constant_{color:#bfbf56;}.class_{color:#8bbf56;}.hljs-strong{font-weight:700;color:#8bbf56;}.inherited__{color:#56bf8b;}.hljs-atrule{color:#568bbf;}.hljs-quote{color:#568bbf;}.hljs-regexp{color:#568bbf;}.function_{color:#8b56bf;}.ruby{color:#8b56bf;}.hljs-property{color:#8b56bf;}.diff{color:#bf568b;}.hljs-meta{color:#bf568b;}.hljs-keyword{color:#bf568b;}.hljs-template-tag{color:#bf568b;}.hljs-type{color:#bf568b;}.hljs-emphasis{font-style:italic;color:#bf568b;}.hljs-meta{color:#bf5656;}.hljs-meta{color:#bf5656;}.hljs-keyword{color:#bf5656;}.hljs-meta{color:#bf5656;}.hljs-string{color:#bf5656;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .heetch:
            /*
             Theme: Heetch Dark
             Author: Geoffrey Teale (tealeg@gmail.com)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#bdb6c5;}.hljs-comment{color:#7b6d8b;}.hljs-tag{color:#9c92a8;}.hljs-operator{color:#bdb6c5;}.hljs-punctuation{color:#bdb6c5;}.hljs-subst{color:#bdb6c5;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#27d9d5;}.hljs-deletion{color:#27d9d5;}.hljs-name{color:#27d9d5;}.hljs-selector-tag{color:#27d9d5;}.hljs-template-variable{color:#27d9d5;}.hljs-variable{color:#27d9d5;}.constant_{color:#5ba2b6;}.class_{color:#8f6c97;}.hljs-strong{font-weight:700;color:#8f6c97;}.inherited__{color:#c33678;}.hljs-atrule{color:#f80059;}.hljs-quote{color:#f80059;}.hljs-regexp{color:#f80059;}.function_{color:#bd0152;}.ruby{color:#bd0152;}.hljs-property{color:#bd0152;}.diff{color:#82034c;}.hljs-meta{color:#82034c;}.hljs-keyword{color:#82034c;}.hljs-template-tag{color:#82034c;}.hljs-type{color:#82034c;}.hljs-emphasis{font-style:italic;color:#82034c;}.hljs-meta{color:#470546;}.hljs-meta{color:#470546;}.hljs-keyword{color:#470546;}.hljs-meta{color:#470546;}.hljs-string{color:#470546;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .horizon:
            /*
             Theme: Horizon Dark
             Author: Michaël Ball (http://github.com/michael-ball/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#cbced0;}.hljs-comment{color:#6f6f70;}.hljs-tag{color:#9da0a2;}.hljs-operator{color:#cbced0;}.hljs-punctuation{color:#cbced0;}.hljs-subst{color:#cbced0;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#e93c58;}.hljs-deletion{color:#e93c58;}.hljs-name{color:#e93c58;}.hljs-selector-tag{color:#e93c58;}.hljs-template-variable{color:#e93c58;}.hljs-variable{color:#e93c58;}.constant_{color:#e58d7d;}.class_{color:#efb993;}.hljs-strong{font-weight:700;color:#efb993;}.inherited__{color:#efaf8e;}.hljs-atrule{color:#24a8b4;}.hljs-quote{color:#24a8b4;}.hljs-regexp{color:#24a8b4;}.function_{color:#df5273;}.ruby{color:#df5273;}.hljs-property{color:#df5273;}.diff{color:#b072d1;}.hljs-meta{color:#b072d1;}.hljs-keyword{color:#b072d1;}.hljs-template-tag{color:#b072d1;}.hljs-type{color:#b072d1;}.hljs-emphasis{font-style:italic;color:#b072d1;}.hljs-meta{color:#e4a382;}.hljs-meta{color:#e4a382;}.hljs-keyword{color:#e4a382;}.hljs-meta{color:#e4a382;}.hljs-string{color:#e4a382;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .humanoid:
            /*
             Theme: Humanoid dark
             Author: Thomas (tasmo) Friese
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#f8f8f2;}.hljs-comment{color:#60615d;}.hljs-tag{color:#c0c0bd;}.hljs-operator{color:#f8f8f2;}.hljs-punctuation{color:#f8f8f2;}.hljs-subst{color:#f8f8f2;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#f11235;}.hljs-deletion{color:#f11235;}.hljs-name{color:#f11235;}.hljs-selector-tag{color:#f11235;}.hljs-template-variable{color:#f11235;}.hljs-variable{color:#f11235;}.constant_{color:#ff9505;}.class_{color:#ffb627;}.hljs-strong{font-weight:700;color:#ffb627;}.inherited__{color:#02d849;}.hljs-atrule{color:#0dd9d6;}.hljs-quote{color:#0dd9d6;}.hljs-regexp{color:#0dd9d6;}.function_{color:#00a6fb;}.ruby{color:#00a6fb;}.hljs-property{color:#00a6fb;}.diff{color:#f15ee3;}.hljs-meta{color:#f15ee3;}.hljs-keyword{color:#f15ee3;}.hljs-template-tag{color:#f15ee3;}.hljs-type{color:#f15ee3;}.hljs-emphasis{color:#f15ee3;font-style:italic;}.hljs-meta{color:#b27701;}.hljs-meta{color:#b27701;}.hljs-keyword{color:#b27701;}.hljs-meta{color:#b27701;}.hljs-string{color:#b27701;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .ia:
            /*
             Theme: iA Dark
             Author: iA Inc. (modified by aramisgithub)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#ccc;}.hljs-comment{color:#767676;}.hljs-tag{color:#b8b8b8;}.hljs-operator{color:#ccc;}.hljs-punctuation{color:#ccc;}.hljs-subst{color:#ccc;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#d88568;}.hljs-deletion{color:#d88568;}.hljs-name{color:#d88568;}.hljs-selector-tag{color:#d88568;}.hljs-template-variable{color:#d88568;}.hljs-variable{color:#d88568;}.constant_{color:#d86868;}.class_{color:#b99353;}.hljs-strong{font-weight:700;color:#b99353;}.inherited__{color:#83a471;}.hljs-atrule{color:#7c9cae;}.hljs-quote{color:#7c9cae;}.hljs-regexp{color:#7c9cae;}.function_{color:#8eccdd;}.ruby{color:#8eccdd;}.hljs-property{color:#8eccdd;}.diff{color:#b98eb2;}.hljs-meta{color:#b98eb2;}.hljs-keyword{color:#b98eb2;}.hljs-template-tag{color:#b98eb2;}.hljs-type{color:#b98eb2;}.hljs-emphasis{color:#b98eb2;font-style:italic;}.hljs-meta{color:#8b6c37;}.hljs-meta{color:#8b6c37;}.hljs-keyword{color:#8b6c37;}.hljs-meta{color:#8b6c37;}.hljs-string{color:#8b6c37;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .isblEditor:
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{}.hljs{color:#f0f0f0;}.hljs-subst{color:#f0f0f0;}.hljs-comment{color:#b5b5b5;font-style:italic;}.hljs-attribute{color:#f0f0f0;font-weight:700;}.hljs-doctag{color:#f0f0f0;font-weight:700;}.hljs-keyword{color:#f0f0f0;font-weight:700;}.hljs-meta{color:#f0f0f0;font-weight:700;}.hljs-keyword{color:#f0f0f0;font-weight:700;}.hljs-name{color:#f0f0f0;font-weight:700;}.hljs-selector-tag{color:#f0f0f0;font-weight:700;}.hljs-string{color:#97bf0d;}.hljs-deletion{color:#f0f0f0;}.hljs-number{color:#f0f0f0;}.hljs-quote{color:#f0f0f0;}.hljs-selector-class{color:#f0f0f0;}.hljs-selector-id{color:#f0f0f0;}.hljs-template-tag{color:#f0f0f0;}.hljs-type{color:#f0f0f0;}.hljs-link{color:#e2c696;}.hljs-regexp{color:#e2c696;}.hljs-selector-attr{color:#e2c696;}.hljs-selector-pseudo{color:#e2c696;}.hljs-symbol{color:#e2c696;}.hljs-template-variable{color:#e2c696;}.hljs-variable{color:#e2c696;}.hljs-built_in{color:#97bf0d;font-weight:700;}.hljs-literal{color:#97bf0d;font-weight:700;}.hljs-addition{color:#397300;}.hljs-bullet{color:#397300;}.hljs-code{color:#397300;}.hljs-class{color:#ce9d4d;font-weight:700;}.hljs-section{color:#df471e;}hljs-class-hljs-title{color:#df471e;}.hljs-built_in{color:#81bce9;font-weight:400;}.hljs-meta{color:#1f7199;}.hljs-meta{color:#4d99bf;}.hljs-string{color:#4d99bf;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .kimbie:
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#d3af86;}.hljs-comment{color:#d6baad;}.hljs-quote{color:#d6baad;}.hljs-meta{color:#dc3958;}.hljs-name{color:#dc3958;}.hljs-regexp{color:#dc3958;}.hljs-selector-class{color:#dc3958;}.hljs-selector-id{color:#dc3958;}.hljs-tag{color:#dc3958;}.hljs-template-variable{color:#dc3958;}.hljs-variable{color:#dc3958;}.hljs-built_in{color:#f79a32;}.hljs-deletion{color:#f79a32;}.hljs-link{color:#f79a32;}.hljs-literal{color:#f79a32;}.hljs-number{color:#f79a32;}.hljs-params{color:#f79a32;}.hljs-type{color:#f79a32;}.hljs-addition{color:#889b4a;}.hljs-bullet{color:#889b4a;}.hljs-string{color:#889b4a;}.hljs-symbol{color:#889b4a;}.hljs-function{color:#98676a;}.hljs-keyword{color:#98676a;}.hljs-selector-tag{color:#98676a;}.hljs-attribute{color:#f06431;}.hljs-section{color:#f06431;}hljs-class-hljs-title{color:#f06431;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .nnfx:
            /*
             Theme: nnfx dark
             Description: a theme inspired by Netscape Navigator/Firefox
             Author: (c) 2020-2021 Jim Mason <jmason@ibinx.com>
             Maintainer: @RocketMan
             License: https://creativecommons.org/licenses/by-sa/4.0  CC BY-SA 4.0
             Updated: 2021-05-17

             @version 1.1.0
             */
            return ".hljs{display:block;padding:1em;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#fff;}.language-xml{font-style:italic;color:#69f;font-weight:700;}.hljs-meta{font-style:italic;color:#69f;font-weight:700;}.language-xml{font-style:italic;color:#69f;font-weight:700;}.hljs-meta-string{font-style:italic;color:#69f;font-weight:700;}.hljs-comment{font-style:italic;color:#9c6;}.hljs-quote{font-style:italic;color:#9c6;}.hljs-built_in{color:#a7a;}.hljs-keyword{color:#a7a;}.hljs-name{color:#a7a;}.hljs-attr{font-weight:700;}.hljs-name{font-weight:700;}.hljs-string{font-weight:400;}.hljs-code{color:#bce;}.hljs-link{color:#bce;}.hljs-meta{color:#bce;}.hljs-string{color:#bce;}.hljs-number{color:#bce;}.hljs-regexp{color:#bce;}.hljs-string{color:#bce;}.hljs-bullet{color:#d40;}.hljs-symbol{color:#d40;}.hljs-template-variable{color:#d40;}hljs-class-hljs-title{color:#d40;}.hljs-variable{color:#d40;}.class_{color:#96c;font-weight:700;}.hljs-type{color:#96c;font-weight:700;}.function_{color:#fff;}.hljs-formula{background-color:#eee;font-style:italic;}.hljs-addition{background-color:#797;}.hljs-deletion{background-color:#c99;}.hljs-meta{color:#69f;}.hljs-section{color:#69f;font-weight:700;}.hljs-selector-class{color:#69f;font-weight:700;}.hljs-selector-id{color:#69f;font-weight:700;}.hljs-selector-pseudo{color:#69f;font-weight:700;}.hljs-selector-tag{color:#69f;font-weight:700;}.hljs-selector-pseudo{font-style:italic;}.hljs-doctag{font-weight:700;}.hljs-strong{font-weight:700;}.hljs-emphasis{font-style:italic;}"
        case .pandaSyntax:
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#e6e6e6;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}.hljs-link{text-decoration:underline;}.hljs-comment{color:#bbb;font-style:italic;}.hljs-quote{color:#bbb;font-style:italic;}.hljs-params{color:#bbb;}.hljs-attr{color:#e6e6e6;}.hljs-punctuation{color:#e6e6e6;}.hljs-meta{color:#ff4b82;}.hljs-name{color:#ff4b82;}.hljs-selector-tag{color:#ff4b82;}.escape_{color:#b084eb;}.hljs-operator{color:#b084eb;}.hljs-deletion{color:#ff75b5;}.hljs-keyword{color:#ff75b5;}.language_{color:#ff9ac1;}.function_{color:#45a9f9;}.inherited__{color:#19f9d8;}.hljs-attribute{color:#ffb86c;}.hljs-built_in{color:#ffb86c;}.hljs-doctag{color:#ffb86c;}.hljs-link{color:#ffb86c;}.hljs-literal{color:#ffb86c;}.hljs-meta{color:#ffb86c;}.hljs-keyword{color:#ffb86c;}.hljs-number{color:#ffb86c;}.hljs-punctuation{color:#ffb86c;}.hljs-selector-id{color:#ffb86c;}.hljs-tag{color:#ffb86c;}.hljs-template-tag{color:#ffb86c;}.hljs-template-variable{color:#ffb86c;}hljs-class-hljs-title{color:#ffb86c;}.hljs-type{color:#ffb86c;}.hljs-variable{color:#ffb86c;}"
        case .papercolor:
            /*
             Theme: PaperColor Dark
             Author: Jon Leopard (http://github.com/jonleopard) based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:grey;}.hljs-comment{color:#d7af5f;}.hljs-tag{color:#5fafd7;}.hljs-operator{color:grey;}.hljs-punctuation{color:grey;}.hljs-subst{color:grey;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#585858;}.hljs-deletion{color:#585858;}.hljs-name{color:#585858;}.hljs-selector-tag{color:#585858;}.hljs-template-variable{color:#585858;}.hljs-variable{color:#585858;}.constant_{color:#5faf5f;}.class_{color:#afd700;}.hljs-strong{color:#afd700;font-weight:700;}.inherited__{color:#af87d7;}.hljs-atrule{color:#ffaf00;}.hljs-quote{color:#ffaf00;}.hljs-regexp{color:#ffaf00;}.function_{color:#ff5faf;}.ruby{color:#ff5faf;}.hljs-property{color:#ff5faf;}.diff{color:#00afaf;}.hljs-meta{color:#00afaf;}.hljs-keyword{color:#00afaf;}.hljs-template-tag{color:#00afaf;}.hljs-type{color:#00afaf;}.hljs-emphasis{color:#00afaf;font-style:italic;}.hljs-meta{color:#5f8787;}.hljs-meta{color:#5f8787;}.hljs-keyword{color:#5f8787;}.hljs-meta{color:#5f8787;}.hljs-string{color:#5f8787;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .paraiso:
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#a39e9b;}.hljs-comment{color:#8d8687;}.hljs-quote{color:#8d8687;}.hljs-link{color:#ef6155;}.hljs-meta{color:#ef6155;}.hljs-name{color:#ef6155;}.hljs-regexp{color:#ef6155;}.hljs-selector-class{color:#ef6155;}.hljs-selector-id{color:#ef6155;}.hljs-tag{color:#ef6155;}.hljs-template-variable{color:#ef6155;}.hljs-variable{color:#ef6155;}.hljs-built_in{color:#f99b15;}.hljs-deletion{color:#f99b15;}.hljs-literal{color:#f99b15;}.hljs-number{color:#f99b15;}.hljs-params{color:#f99b15;}.hljs-type{color:#f99b15;}.hljs-attribute{color:#fec418;}.hljs-section{color:#fec418;}hljs-class-hljs-title{color:#fec418;}.hljs-addition{color:#48b685;}.hljs-bullet{color:#48b685;}.hljs-string{color:#48b685;}.hljs-symbol{color:#48b685;}.hljs-keyword{color:#815ba4;}.hljs-selector-tag{color:#815ba4;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .qtcreator:
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs{color:#aaa;}.hljs-emphasis{color:#a8a8a2;}.hljs-strong{color:#a8a8a2;}.hljs-bullet{color:#f5f;}.hljs-literal{color:#f5f;}.hljs-number{color:#f5f;}.hljs-quote{color:#f5f;}.hljs-regexp{color:#f5f;}.hljs-code{color:#aaf;}.hljs-selector-class{color:#aaf;}.hljs-emphasis{font-style:italic;}.hljs-stronge{font-style:italic;}.hljs-type{font-style:italic;}.hljs-function{color:#ff5;}.hljs-keyword{color:#ff5;}.hljs-name{color:#ff5;}.hljs-section{color:#ff5;}.hljs-selector-tag{color:#ff5;}.hljs-symbol{color:#ff5;}.hljs-subst{color:#aaa;}.hljs-tag{color:#aaa;}hljs-class-hljs-title{color:#aaa;}.hljs-attribute{color:#f55;}.class_{color:#88f;}.hljs-variable{color:#88f;}.hljs-addition{color:#f5f;}.hljs-built_in{color:#f5f;}.hljs-link{color:#f5f;}.hljs-selector-attr{color:#f5f;}.hljs-selector-id{color:#f5f;}.hljs-selector-pseudo{color:#f5f;}.hljs-string{color:#f5f;}.hljs-template-tag{color:#f5f;}.hljs-template-variable{color:#f5f;}.hljs-type{color:#f5f;}.hljs-comment{color:#5ff;}.hljs-deletion{color:#5ff;}.hljs-meta{color:#5ff;}"
        case .silk:
            /*
             Theme: Silk Dark
             Author: Gabriel Fontes (https://github.com/Misterio77)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#c7dbdd;}.hljs-comment{color:#587073;}.hljs-tag{color:#9dc8cd;}.hljs-operator{color:#c7dbdd;}.hljs-punctuation{color:#c7dbdd;}.hljs-subst{color:#c7dbdd;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#fb6953;}.hljs-deletion{color:#fb6953;}.hljs-name{color:#fb6953;}.hljs-selector-tag{color:#fb6953;}.hljs-template-variable{color:#fb6953;}.hljs-variable{color:#fb6953;}.constant_{color:#fcab74;}.class_{color:#fce380;}.hljs-strong{font-weight:700;color:#fce380;}.inherited__{color:#73d8ad;}.hljs-atrule{color:#3fb2b9;}.hljs-quote{color:#3fb2b9;}.hljs-regexp{color:#3fb2b9;}.function_{color:#46bddd;}.ruby{color:#46bddd;}.hljs-property{color:#46bddd;}.diff{color:#756b8a;}.hljs-meta{color:#756b8a;}.hljs-keyword{color:#756b8a;}.hljs-template-tag{color:#756b8a;}.hljs-type{color:#756b8a;}.hljs-emphasis{color:#756b8a;font-style:italic;}.hljs-meta{color:#9b647b;}.hljs-meta{color:#9b647b;}.hljs-keyword{color:#9b647b;}.hljs-meta{color:#9b647b;}.hljs-string{color:#9b647b;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .solarFlare:
            /*
             Theme: Solar Flare
             Author: Chuck Harmston (https://chuck.harmston.ch)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;display:block;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#a6afb8;}.hljs-comment{color:#667581;}.hljs-tag{color:#85939e;}.hljs-operator{color:#a6afb8;}.hljs-punctuation{color:#a6afb8;}.hljs-subst{color:#a6afb8;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ef5253;}.hljs-deletion{color:#ef5253;}.hljs-name{color:#ef5253;}.hljs-selector-tag{color:#ef5253;}.hljs-template-variable{color:#ef5253;}.hljs-variable{color:#ef5253;}.constant_{color:#e66b2b;}.class_{color:#e4b51c;}.hljs-strong{color:#e4b51c;font-weight:700;}.inherited__{color:#7cc844;}.hljs-atrule{color:#52cbb0;}.hljs-quote{color:#52cbb0;}.hljs-regexp{color:#52cbb0;}.function_{color:#33b5e1;}.ruby{color:#33b5e1;}.hljs-property{color:#33b5e1;}.diff{color:#a363d5;}.hljs-meta{color:#a363d5;}.hljs-keyword{color:#a363d5;}.hljs-template-tag{color:#a363d5;}.hljs-type{color:#a363d5;}.hljs-emphasis{font-style:italic;color:#a363d5;}.hljs-meta{color:#d73c9a;}.hljs-meta{color:#d73c9a;}.hljs-keyword{color:#d73c9a;}.hljs-meta{color:#d73c9a;}.hljs-string{color:#d73c9a;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .solarized:
            /*
             Theme: Solarized Dark
             Author: Ethan Schoonover (modified by aramisgithub)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#93a1a1;}.hljs-comment{color:#657b83;}.hljs-tag{color:#839496;}.hljs-operator{color:#93a1a1;}.hljs-punctuation{color:#93a1a1;}.hljs-subst{color:#93a1a1;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#dc322f;}.hljs-deletion{color:#dc322f;}.hljs-name{color:#dc322f;}.hljs-selector-tag{color:#dc322f;}.hljs-template-variable{color:#dc322f;}.hljs-variable{color:#dc322f;}.constant_{color:#cb4b16;}.class_{color:#b58900;}.hljs-strong{font-weight:700;color:#b58900;}.inherited__{color:#859900;}.hljs-atrule{color:#2aa198;}.hljs-quote{color:#2aa198;}.hljs-regexp{color:#2aa198;}.function_{color:#268bd2;}.ruby{color:#268bd2;}.hljs-property{color:#268bd2;}.diff{color:#6c71c4;}.hljs-meta{color:#6c71c4;}.hljs-keyword{color:#6c71c4;}.hljs-template-tag{color:#6c71c4;}.hljs-type{color:#6c71c4;}.hljs-emphasis{color:#6c71c4;font-style:italic;}.hljs-meta{color:#d33682;}.hljs-meta{color:#d33682;}.hljs-keyword{color:#d33682;}.hljs-meta{color:#d33682;}.hljs-string{color:#d33682;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .stackoverflow:
            /*
             Theme: StackOverflow Dark
             Description: Dark theme as used on stackoverflow.com
             Author: stackoverflow.com
             Maintainer: @Hirse
             Website: https://github.com/StackExchange/Stacks
             License: MIT
             Updated: 2021-05-15

             Updated for @stackoverflow/stacks v0.64.0
             Code Blocks: /blob/v0.64.0/lib/css/components/_stacks-code-blocks.less
             Colors: /blob/v0.64.0/lib/css/exports/_stacks-constants-colors.less
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#fff;}.hljs-subst{color:#fff;}.hljs-comment{color:#999;}.hljs-attr{color:#88aece;}.hljs-doctag{color:#88aece;}.hljs-keyword{color:#88aece;}.hljs-meta{color:#88aece;}.hljs-keyword{color:#88aece;}.hljs-section{color:#88aece;}.hljs-selector-tag{color:#88aece;}.hljs-attribute{color:#c59bc1;}.hljs-name{color:#f08d49;}.hljs-number{color:#f08d49;}.hljs-quote{color:#f08d49;}.hljs-selector-id{color:#f08d49;}.hljs-template-tag{color:#f08d49;}.hljs-type{color:#f08d49;}.hljs-selector-class{color:#88aece;}.hljs-link{color:#b5bd68;}.hljs-regexp{color:#b5bd68;}.hljs-selector-attr{color:#b5bd68;}.hljs-string{color:#b5bd68;}.hljs-symbol{color:#b5bd68;}.hljs-template-variable{color:#b5bd68;}.hljs-variable{color:#b5bd68;}.hljs-meta{color:#88aece;}.hljs-selector-pseudo{color:#88aece;}.hljs-built_in{color:#f08d49;}.hljs-literal{color:#f08d49;}hljs-class-hljs-title{color:#f08d49;}.hljs-bullet{color:#ccc;}.hljs-code{color:#ccc;}.hljs-meta{color:#b5bd68;}.hljs-string{color:#b5bd68;}.hljs-deletion{color:#de7176;}.hljs-addition{color:#76c490;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .standard:
            /*
             Theme: Default Dark
             Author: Chris Kempson (http://chriskempson.com)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{overflow-x:auto;display:block;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#d8d8d8;}.hljs-comment{color:#585858;}.hljs-tag{color:#b8b8b8;}.hljs-operator{color:#d8d8d8;}.hljs-punctuation{color:#d8d8d8;}.hljs-subst{color:#d8d8d8;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ab4642;}.hljs-deletion{color:#ab4642;}.hljs-name{color:#ab4642;}.hljs-selector-tag{color:#ab4642;}.hljs-template-variable{color:#ab4642;}.hljs-variable{color:#ab4642;}.constant_{color:#dc9656;}.class_{color:#f7ca88;}.hljs-strong{font-weight:700;color:#f7ca88;}.inherited__{color:#a1b56c;}.hljs-atrule{color:#86c1b9;}.hljs-quote{color:#86c1b9;}.hljs-regexp{color:#86c1b9;}.function_{color:#7cafc2;}.ruby{color:#7cafc2;}.hljs-property{color:#7cafc2;}.diff{color:#ba8baf;}.hljs-meta{color:#ba8baf;}.hljs-keyword{color:#ba8baf;}.hljs-template-tag{color:#ba8baf;}.hljs-type{color:#ba8baf;}.hljs-emphasis{color:#ba8baf;font-style:italic;}.hljs-meta{color:#a16946;}.hljs-meta{color:#a16946;}.hljs-keyword{color:#a16946;}.hljs-meta{color:#a16946;}.hljs-string{color:#a16946;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .summerfruit:
            /*
             Theme: Summerfruit Dark
             Author: Christopher Corley (http://christop.club/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;padding:1em;overflow-x:auto;}.hljs{padding:3px 5px;}.hljs{color:#d0d0d0;}.hljs-comment{color:#505050;}.hljs-tag{color:#b0b0b0;}.hljs-operator{color:#d0d0d0;}.hljs-punctuation{color:#d0d0d0;}.hljs-subst{color:#d0d0d0;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#ff0086;}.hljs-deletion{color:#ff0086;}.hljs-name{color:#ff0086;}.hljs-selector-tag{color:#ff0086;}.hljs-template-variable{color:#ff0086;}.hljs-variable{color:#ff0086;}.constant_{color:#fd8900;}.class_{color:#aba800;}.hljs-strong{font-weight:700;color:#aba800;}.inherited__{color:#00c918;}.hljs-atrule{color:#1faaaa;}.hljs-quote{color:#1faaaa;}.hljs-regexp{color:#1faaaa;}.function_{color:#3777e6;}.ruby{color:#3777e6;}.hljs-property{color:#3777e6;}.diff{color:#ad00a1;}.hljs-meta{color:#ad00a1;}.hljs-keyword{color:#ad00a1;}.hljs-template-tag{color:#ad00a1;}.hljs-type{color:#ad00a1;}.hljs-emphasis{color:#ad00a1;font-style:italic;}.hljs-meta{color:#c63;}.hljs-meta{color:#c63;}.hljs-keyword{color:#c63;}.hljs-meta{color:#c63;}.hljs-string{color:#c63;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .synthMidnightTerminal:
            /*
             Theme: Synth Midnight Terminal Dark
             Author: Michaël Ball (http://github.com/michael-ball/)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{padding:1em;overflow-x:auto;display:block;}.hljs{padding:3px 5px;}.hljs{color:#c1c3c4;}.hljs-comment{color:#474849;}.hljs-tag{color:#a3a5a6;}.hljs-operator{color:#c1c3c4;}.hljs-punctuation{color:#c1c3c4;}.hljs-subst{color:#c1c3c4;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#b53b50;}.hljs-deletion{color:#b53b50;}.hljs-name{color:#b53b50;}.hljs-selector-tag{color:#b53b50;}.hljs-template-variable{color:#b53b50;}.hljs-variable{color:#b53b50;}.constant_{color:#ea770d;}.class_{color:#c9d364;}.hljs-strong{font-weight:700;color:#c9d364;}.inherited__{color:#06ea61;}.hljs-atrule{color:#42fff9;}.hljs-quote{color:#42fff9;}.hljs-regexp{color:#42fff9;}.function_{color:#03aeff;}.ruby{color:#03aeff;}.hljs-property{color:#03aeff;}.diff{color:#ea5ce2;}.hljs-meta{color:#ea5ce2;}.hljs-keyword{color:#ea5ce2;}.hljs-template-tag{color:#ea5ce2;}.hljs-type{color:#ea5ce2;}.hljs-emphasis{color:#ea5ce2;font-style:italic;}.hljs-meta{color:#cd6320;}.hljs-meta{color:#cd6320;}.hljs-keyword{color:#cd6320;}.hljs-meta{color:#cd6320;}.hljs-string{color:#cd6320;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .tokyoNight:
            /*
             Theme: Tokyo-night-Dark
             origin: https://github.com/enkia/tokyo-night-vscode-theme
             Description: Original highlight.js style
             Author: (c) Henri Vandersleyen <hvandersleyen@gmail.com>
             License: see project LICENSE
             Touched: 2022
             */
            return ".hljs{overflow-x:auto;padding:1em;display:block;}.hljs{padding:3px 5px;}.hljs-comment{color:#565f89;}.hljs-meta{color:#565f89;}.language_{color:#f7768e;}.hljs-link{color:#ff9e64;}.hljs-literal{color:#ff9e64;}.hljs-number{color:#ff9e64;}.hljs-params{color:#ff9e64;}.hljs-template-variable{color:#ff9e64;}.hljs-type{color:#ff9e64;}.hljs-variable{color:#ff9e64;}.hljs-attribute{color:#e0af68;}.hljs-built_in{color:#e0af68;}.function_{color:#7dcfff;}.hljs-selector-tag{color:#73daca;}.hljs-addition{color:#9ece6a;}.hljs-bullet{color:#9ece6a;}.hljs-quote{color:#9ece6a;}.hljs-string{color:#9ece6a;}.hljs-symbol{color:#9ece6a;}.hljs-code{color:#7aa2f7;}.hljs-formula{color:#7aa2f7;}.hljs-section{color:#7aa2f7;}.escape_{color:#bb9af7;}.hljs-keyword{color:#bb9af7;}.hljs-name{color:#bb9af7;}.hljs-operator{color:#bb9af7;}.hljs-punctuation{color:#c0caf5;}.hljs{color:#9aa5ce;}.hljs-emphasis{font-style:italic;}.hljs-strong{font-weight:700;}"
        case .unikitty:
            /*
             Theme: Unikitty Dark
             Author: Josh W Lewis (@joshwlewis)
             License: ~ MIT (or more permissive) [via base16-schemes-source]
             Maintainer: @highlightjs/core-team
             Version: 2021.09.0
             */
            return ".hljs{display:block;overflow-x:auto;padding:1em;}.hljs{padding:3px 5px;}.hljs{color:#bcbabe;}.hljs-comment{color:#838085;}.hljs-tag{color:#9f9da2;}.hljs-operator{color:#bcbabe;}.hljs-punctuation{color:#bcbabe;}.hljs-subst{color:#bcbabe;}.hljs-operator{opacity:.7;}.hljs-bullet{color:#d8137f;}.hljs-deletion{color:#d8137f;}.hljs-name{color:#d8137f;}.hljs-selector-tag{color:#d8137f;}.hljs-template-variable{color:#d8137f;}.hljs-variable{color:#d8137f;}.constant_{color:#d65407;}.class_{color:#dc8a0e;}.hljs-strong{font-weight:700;color:#dc8a0e;}.inherited__{color:#17ad98;}.hljs-atrule{color:#149bda;}.hljs-quote{color:#149bda;}.hljs-regexp{color:#149bda;}.function_{color:#796af5;}.ruby{color:#796af5;}.hljs-property{color:#796af5;}.diff{color:#bb60ea;}.hljs-meta{color:#bb60ea;}.hljs-keyword{color:#bb60ea;}.hljs-template-tag{color:#bb60ea;}.hljs-type{color:#bb60ea;}.hljs-emphasis{font-style:italic;color:#bb60ea;}.hljs-meta{color:#c720ca;}.hljs-meta{color:#c720ca;}.hljs-keyword{color:#c720ca;}.hljs-meta{color:#c720ca;}.hljs-string{color:#c720ca;}.hljs-meta{font-weight:700;}.hljs-keyword{font-weight:700;}.hljs-meta-keyword{font-weight:700;}"
        case .xcode:
            return ".hljs{padding:0.5em;overflow-x:auto;display:block;color:white;}.xml{color:#6C7986;}.hljs-meta{color:#6C7986;}.hljs-comment{color:#6C7986;}.hljs-quote{color:#6C7986;}.hljs-tag{color:#FC5FA3;}.hljs-attribute{color:#FC5FA3;}.hljs-keyword{color:#FC5FA3;}.hljs-selector-tag{color:#FC5FA3;}.hljs-literal{color:#FC5FA3;}.hljs-name{color:#FC5FA3;}.hljs-variable{color:#FC5FA3;}.hljs-template-variable{color:#FC5FA3;}.hljs-code{color:#FC6A5D;}.hljs-string{color:#FC6A5D;}.hljs-meta-string{color:#FC6A5D;}.hljs-regexp{color:#5482FF;}.hljs-link{color:#5482FF;}hljs-class-hljs-title{color:#41A1C0;}.hljs-symbol{color:#41A1C0;}.hljs-bullet{color:#41A1C0;}.hljs-number{color:#41A1C0;}.hljs-section{color:#FC5FA3;}.hljs-meta{color:#FC5FA3;}.hljs-class{color:#D0A8FF;}hljs-class-hljs-title{color:#D0A8FF;}.hljs-type{color:#D0A8FF;}.hljs-built_in{color:#D0A8FF;}.hljs-builtin-name{color:#D0A8FF;}.hljs-params{color:#D0A8FF;}.hljs-attr{color:#BF8555;}.hljs-subst{color:#FFF;}.hljs-formula{background-color:#000;font-style:italic;}.hljs-addition{background-color:#baeeba;}.hljs-deletion{background-color:#ffc8bd;}.hljs-selector-id{color:#9b703f;}.hljs-selector-class{color:#9b703f;}.hljs-doctag{font-weight:bold;}.hljs-strong{font-weight:bold;}.hljs-emphasis{font-style:italic;}"
        }
    }
}
