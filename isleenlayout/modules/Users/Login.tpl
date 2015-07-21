{strip}
{extends file='loginLayout.tpl'}
{block name=loginBody}
	<div class="container">
	
		<div id="loginDiv" style="display:block;">
			<form class="form-signin" action="index.php?module=Users&action=Login" method="POST">
				<h2 class="form-signin-heading">Login to IsleenCRM</h2>
				<div class="login-wrap">
					{if isset($smarty.request.error)}
						<div class="alert alert-block alert-danger fade in">
                             <button data-dismiss="alert" class="close close-sm" type="button">
                                  <i class="fa fa-times"></i>
                             </button>
                             Invalid username or password.
                         </div>
					{/if}
					<input type="text" class="form-control" name="username" placeholder="Username" autofocus="">
					<input type="password" class="form-control" name="password" placeholder="Password">
					<button class="btn btn-lg btn-login btn-block UserLogin" type="submit">Log in</button>
					<label>
						<span class="pull-right">
                   	 		<a id="forgotPassword">Forgot Password?</a>
                		</span>
                	</label>
				</div>		
			</form>		
		</div>
		
		<div id="fpDiv" style="display:none;">
			<form class="form-signin" style="margin:0;" action="forgotPassword.php" method="POST">				
				<h2 class="form-signin-heading">Forgot Password</h2>			
				<div class="login-wrap">
					<input type="text" class="form-control" id="username" name="user_name" placeholder="User Name"/>				
					<input type="password" class="form-control" id="emailId" name="emailId" placeholder="Email"/>					
					<input type="submit" class="btn btn-lg btn-login btn-block UserSubmit" value="Submit" name="retrievePassword">
					<label>
						<span class="pull-right">
		              	 	<a id="backButton">Back</a>
		                	</span>
		            </label>				
				</div>	
			</form>
		</div>
					
	</div>
{/block}
{/strip}
