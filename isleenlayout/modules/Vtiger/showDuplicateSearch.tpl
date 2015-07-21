{strip}
<div id="DuplicateSearch" class='modelContainer'>
	<div class="modal-header contentsBackground">
        <button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">&times;</button>
		<h3>{vtranslate('LBL_MERGING_CRITERIA_SELECTION', $MODULE)}</h3>
	</div>
	<form class="form-horizontal" id="findDuplicate" action="index.php">
		<input type='hidden' name='module' value='{$MODULE}' />
		<input type='hidden' name='view' value='FindDuplicates' />
		<br>
		<div class="col-md-12">
			<div class="control-group FloatWidth m-bot15">
				<span class="control-label col-md-6">
					{vtranslate('LBL_AVAILABLE_FIELDS', $MODULE)}
				</span>
				<div class="controls col-md-6">
					<div class="row-fluid">
						<span class="DuplicateSearchSelect">
							<select id="fieldList" class="select2 row-fluid" multiple="true" name="fields[]"
								data-validation-engine="validate[required]">
								{foreach from=$FIELDS item=FIELD}
									{if $FIELD->isViewableInDetailView()}
										<option value="{$FIELD->getName()}">{vtranslate($FIELD->get('label'), $MODULE)}</option>
									{/if}
								{/foreach}
							</select>
						</span>
					</div>
				</div>
			</div>
			<div class="control-group FloatWidth">
				<div class="col-md-6"></div>
				<div class="controls col-md-6">
					<div class="row-fluid">
						<label>
							<input type="checkbox" name="ignoreEmpty" checked />
								<span class="alignMiddle">&nbsp;{vtranslate('LBL_IGNORE_EMPTY_VALUES', $MODULE)}</span>
							</label>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer FloatWidth">
			<div class="pull-right cancelLinkContainer">
				<a class="cancelLink" type="reset" data-dismiss="modal" data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
			</div>
			<button class="btn btn-success" type="submit" disabled="true">
				<strong>{vtranslate('LBL_FIND_DUPLICATES', $MODULE)}</strong>
			</button>
		</div>	
</form>
</div>
{/strip}