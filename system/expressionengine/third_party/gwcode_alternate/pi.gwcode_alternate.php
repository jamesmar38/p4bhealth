<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');
/*
============================================================
 This ExpressionEngine plugin was created by Leon Dijk
 - http://gwcode.com/
============================================================
 This plugin is licensed under a
 Creative Commons Attribution-NoDerivs 3.0 Unported License.
 - http://creativecommons.org/licenses/by-nd/3.0/
============================================================
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
============================================================
This plugin is for EE2.x!
*/

$plugin_info = array(
	'pi_name'          => 'GWcode Alternate',
	'pi_version'       => '1.0.0',
	'pi_author'        => 'Leon Dijk',
	'pi_author_url'    => 'http://gwcode.com/add-ons/gwcode-alternate',
	'pi_description'   => 'Create alternations, for CSS classes for example.',
	'pi_usage'         => Gwcode_alternate::usage()
);

class Gwcode_alternate {
	public $return_data = '';
	public $tagdata = '';
	public $count = '';
	public $alternate = '';
	
	public function Gwcode_alternate() {
		$this->__construct();
	}
	
	public function __construct() {
		$this->EE =& get_instance();
		$this->alternate = $this->EE->TMPL->fetch_param('alternate');
		$this->count = $this->EE->TMPL->fetch_param('count');
		if(empty($this->alternate) || !ctype_digit($this->count)) {
			return false;
		}

		$this->tagdata = $this->EE->TMPL->tagdata;
		$mode = ($this->tagdata) ? 'pair' : 'single';

		$alternate_arr = explode('|',$this->alternate);
		$alternate_count = count($alternate_arr);
		
		$left_over = $this->count % $alternate_count;
		$arr_key = ($left_over != 0) ? $left_over-1 : $alternate_count-1;
		
		if($mode == 'single') {
			$this->return_data = $alternate_arr[$arr_key];
		}
		else {
			$this->return_data = str_replace('{alternate_value}', $alternate_arr[$arr_key], $this->tagdata);
		}
	} // end function __construct

	// ----------------------------------------
	// Plugin Usage
	// ----------------------------------------
	// This function describes how the plugin is used.
	public function usage() {
		ob_start();
?>
You can use this plugin to rotate through any number of values, similar to the switch variable in the {exp:channel:entries} tag for example.

The most straightforward use for this would be to alternate CSS classes.

Required parameters:
- count
- alternate

Variables (when using a tag pair - see 2nd example):
- {alternate_value}

EXAMPLES

Using a single tag:
<ul>
{exp:channel:categories channel="example" style="linear"}
	<li class="{exp:gwcode_alternate count="{count}" alternate="uneven|even"}">{category_name}</li>
{/exp:channel:categories}
</ul>

Using a tag pair:
<ul>
{exp:channel:categories channel="example" style="linear"}
	{exp:gwcode_alternate count="{count}" alternate="one|two|three"}<li class="{alternate_value}">{alternate_value}: {category_name}</li>{/exp:gwcode_alternate}
{/exp:channel:categories}
</ul>
<?php
		$buffer = ob_get_contents();
		ob_end_clean();
		return $buffer;
	} // end function usage
} // end class