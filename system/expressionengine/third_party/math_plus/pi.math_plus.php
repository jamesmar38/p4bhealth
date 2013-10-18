<?php

/*
=====================================================
 This ExpressionEngine plugin was created by Laisvunas
 - http://devot-ee.com/developers/ee/laisvunas/
=====================================================
 Copyright (c) Laisvunas
=====================================================
 You may use this Software on the SINGLE website.
 Unless you have been granted prior, written consent from Laisvunas, you may not:
 * Reproduce, distribute, or transfer the Software, or portions thereof, to any third party
 * Sell, rent, lease, assign, or sublet the Software or portions thereof
 * Grant rights to any other person
=====================================================
 Purpose: provides support for mathematical operations 
 in templates.
=====================================================
*/

$plugin_info = array(
						'pi_name'			=> 'Math Plus',
						'pi_version'		=> '1.1.2',
						'pi_author'			=> 'Laisvunas',
						'pi_author_url'		=> 'http://devot-ee.com/developers/ee/laisvunas/',
						'pi_description'	=> 'Provides support for mathematical operations 
 in templates',
						'pi_usage'			=> Math_plus::usage()
					);
     
class Math_plus {

  var $return_data = '';
  
  function Math_plus()
  {
    $this->EE =& get_instance();
    
    // Fetch tagdata
    $tagdata = $this->EE->TMPL->tagdata;
    
    // Fetch parameters
  		$calculate = $this->EE->TMPL->fetch_param('calculate');
  		$invalid_input = $this->EE->TMPL->fetch_param('invalid_input');
    $on_non_numeric_vars = $this->EE->TMPL->fetch_param('on_non_numeric_vars') ? $this->EE->TMPL->fetch_param('on_non_numeric_vars') : '';
  		
  		// Define variables
  		$found_invalid = FALSE;
  		$result = '';
    $conds = array();
    $vars_max_number = 50;
    $param_names = array();
    $non_numeric_vars = FALSE;
    
    // "calculate" parameter is required
  		if ($calculate === FALSE)
  		{
      if ($invalid_input === 'alert')
      {
        echo 'ERROR! Parameter "calculate" of exp:simple_math tag not defined!<br><br>';
      }
      $found_invalid = TRUE;
    }
    
    for ($i = 1; $i <= $vars_max_number; $i++)
    {
      $param_names[$i] = 'var'.$i;
      ${$param_names[$i]} = $this->EE->TMPL->fetch_param('var'.$i);
      if (${$param_names[$i]} !== FALSE)
      {
        if (is_numeric(${$param_names[$i]}))
        {
          $calculate = str_replace(LD.'var'.$i.RD, ${$param_names[$i]}, $calculate);
          
        }
        else
        {
          $found_invalid = TRUE;
          $non_numeric_vars = TRUE;
          break;
        } 
      }
    }
    
    if ($found_invalid === FALSE)
    {
      //$calculate = $this->EE->db->escape_str($calculate);
      //echo '1 $calculate: '.$calculate.'<br><br>';
    		$calculate = str_replace('&#47;', "/", $calculate);
    		//echo '2 $calculate: '.$calculate.'<br><br>';
    		$evalstring = '$result = '.$calculate.';';
    		@eval($evalstring);
    		//echo '$result: '.$result.'<br><br>';
      $conds['math_plus_result'] = $result;
      
      // Evaluate conditionals
      $tagdata = $this->EE->functions->prep_conditionals($tagdata, $conds);
      // Substitutes {simple_math_result} variable with matching value
      $tagdata = $this->EE->TMPL->swap_var_single('math_plus_result', $conds['math_plus_result'], $tagdata);
    }
    else
    {
      $conds['math_plus_result'] = '';
      
      if ($non_numeric_vars AND $on_non_numeric_vars)
      {
        $conds['math_plus_result'] = $on_non_numeric_vars;
      }
      
      // Evaluate conditionals
      $tagdata = $this->EE->functions->prep_conditionals($tagdata, $conds);
      // Substitutes {simple_math_result} variable with matching value
      $tagdata = $this->EE->TMPL->swap_var_single('math_plus_result', $conds['math_plus_result'], $tagdata);
    }
    
    return $this->return_data = $tagdata;
  }
  
// ----------------------------------------
//  Plugin Usage
// ----------------------------------------
// This function describes how the plugin is used.
//  Make sure and use output buffering

function usage()
{
ob_start(); 
?>
PARAMETERS

1) calculate - Required. Alows you to input a string consisting of numbers,
symbols of mathematical operations and round brackets, e.g
calculate = "(10 + 5) / 3". Examples of symbols of supported mathematical operations are:
+ (addition), - (subtraction), * (multiplication), / (division), 
% (division remainder), ++ (increment), -- (decrement).

2) invalid_input - Optional. Accepts two values: “alert” and “silence”.
Default value is “silence”. If the value is “alert”, then in cases when 
the plugin has some problem with parameters,  PHP alert is being shown;
if the value is “silence”, then in cases when the plugin has 
some problem with parameters, it finishes its work without any alert being shown. 
Set this parameter to “alert” for development, and to “silence” - for deployment.

3) var1, var2, var3, var4 ... var48, var49, var50 - Optional. Allows you to input numbers.
Used to gain more security - the values of these parameters will be checked if they really are numbers.
Each these parameters can be used inside "calculate" parameter. E.g. var1="10" var2="5" var3="3" calculate="({var1} + {var2}) / {var3}"

4) on_non_numeric_vars - Optional. Allows you to specify what variable {math_plus_result} should output in case
some of var1, var2, var3, etc. variables were found to be non numeric.

USAGE

Use this plugin as folllows:

{exp:math_plus calculate="(10 + 5) / 3"}
{math_plus_result}
{/exp:math_plus}

Or use it this way:

{exp:math_plus calculate="({var1} + {var2}) / {var3}" var1="10" var2="5" var3="3"}
{math_plus_result}
{/exp:math_plus}

<?php
$buffer = ob_get_contents();
	
ob_end_clean(); 

return $buffer;
}
// END USAGE

}

?>