<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<style type="text/css">
   /* Toggle hide/show - no Js
        --------------------------------*/
        .toggle-box-region {background-color:#fff; border:1px solid #d9d9d9; padding:16px 18px;}
        .toggle-box {display:none;}
        .toggle-box + label {
            color:#555;
            cursor:pointer;
            display:block;
            font-weight:bold;
            line-height:23px;
            padding:.3em 0 .3em 26px;
            position:relative;
        }

        .toggle-box + label + div {display:none; margin:0 0 14px;}
        .toggle-box:checked + label:nth-child(n) + div {display:block;}

        .toggle-box + label:before {
            position:absolute;
            content:"\f0fe";
            font-family:FontAwesome;
            top:.3em;
            left:0px;
            color:#0085a6;
        }
        .toggle-box:checked + label {color:#0085a6;}
        .toggle-box:checked + label:before {content:"\f146";}
        .toggle-box-content {border-bottom:1px double #bfbfbf; color:#000; padding:2px 1em .6em 28px;}

        /* General */
        *, *:before, *:after {
            -webkit-box-sizing: border-box;
               -moz-box-sizing: border-box;
                    box-sizing: border-box;
        }

        .box-test {
          padding:3em;
        }

      .tresh a{
         position: absolute;
         right: 0;
         z-index: 9;
      }
      .Skills{
         position: relative;
      }
      .skill_level{
         position: absolute;
         right: 20;
         z-index: 9;
         margin-left: 304px;
      }
      .delete{
         position: absolute;
         right: 0;
         z-index: 9;
      }

</style>