<div class="buttons">
  <div class="right">    
    <input type="submit" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" onclick="url()" />
  </div>
</div>


	<script language="javascript" type="text/javascript">
        function url(){			
            window.self.location='<?php print($url);?>';
        }
    </script>
