{strip}
<section class="panel DetailViewRemoveBorder">
<div class="panel-body">
<div class="recentActivitiesContainer timeline">
	<div>
		{if !empty($RECENT_ACTIVITIES)}
				{foreach item=RECENT_ACTIVITY from=$RECENT_ACTIVITIES}
					{if $RECENT_ACTIVITY->isCreate()}
						<article class="timeline-item">
							<div class="timeline-desk">
								<div class="panel">
									<div class="panel-body">
										 <span class="arrow"></span>
										<span class="timeline-icon red"></span>
										<span class="timeline-date">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"h:i A"}</span>
										<h1 class="red">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"d F | l"}</h1>
										<p>{$RECENT_ACTIVITY->getModifiedBy()->getName()} {vtranslate('LBL_CREATED', $MODULE_NAME)}</p>
									</div>
								</div>
							</div>
						</article>
					{else if $RECENT_ACTIVITY->isUpdate()}
						<article class="timeline-item">
							<div class="timeline-desk">
								<div class="panel">
									<div class="panel-body">
										 <span class="arrow"></span>
										<span class="timeline-icon red"></span>
										<span class="timeline-date">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"h:i A"}</span>
										<h1 class="red">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"d F | l"}</h1>
										<p>{$RECENT_ACTIVITY->getModifiedBy()->getName()} {vtranslate('LBL_CREATED', $MODULE_NAME)}
									

							{foreach item=FIELDMODEL from=$RECENT_ACTIVITY->getFieldInstances()}
								{if $FIELDMODEL && $FIELDMODEL->getFieldInstance() && $FIELDMODEL->getFieldInstance()->isViewableInDetailView()}
									<div class='font-x-small updateInfoContainer' style="word-wrap: break-word;">
										<i>{vtranslate($FIELDMODEL->getName(),$MODULE_NAME)}</i> :&nbsp;
										{if $FIELDMODEL->get('prevalue') neq ''}
											{$FIELDMODEL->getDisplayValue($FIELDMODEL->get('prevalue'))}&nbsp;{vtranslate('LBL_TO', $MODULE_NAME)}&nbsp;
										{else}
											{* First time change *}
										{/if}
										<b>{$FIELDMODEL->getDisplayValue($FIELDMODEL->get('postvalue'))}</b>
									</div>
								{/if}
							{/foreach}
								</p>
							</div>
								</div>
							</div>	

						</article>
					{else if $RECENT_ACTIVITY->isRelationLink()}
						{assign var=RELATION value=$RECENT_ACTIVITY->getRelationInstance()}
						<article class="timeline-item">
							<div class="timeline-desk">
								<div class="panel">
									<div class="panel-body">
										 <span class="arrow"></span>
										<span class="timeline-icon red"></span>
										<span class="timeline-date">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"h:i A"}</span>
										<h1 class="red">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"d F | l"}</h1>
										<p>{vtranslate($RELATION->getLinkedRecord()->getModuleName(), $RELATION->getLinkedRecord()->getModuleName())} {vtranslate('LBL_ADDED', $MODULE_NAME)} <strong>{$RELATION->getLinkedRecord()->getName()}</strong></p>
									</div>
								</div>
							</div>
						</article>
					{else if $RECENT_ACTIVITY->isRelationUnLink()}
						{assign var=URELATION value=$RECENT_ACTIVITY->getRelationInstance()}
						<article class="timeline-item">
							<div class="timeline-desk">
								<div class="panel">
									<div class="panel-body">
										 <span class="arrow"></span>
										<span class="timeline-icon red"></span>
										<span class="timeline-date">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"h:i A"}</span>
										<h1 class="red">{Vtiger_Util_Helper::formatDateDiffInStrings($RECENT_ACTIVITY->getParent()->get('createdtime'))|date_format:"d F | l"}</h1>
										<p>{vtranslate($URELATION->getLinkedRecord()->getModuleName(), $URELATION->getLinkedRecord()->getModuleName())} {vtranslate('LBL_ADDED', $MODULE_NAME)} <strong>{$URELATION->getLinkedRecord()->getName()}</strong></p>
									</div>
								</div>
							</div>
						</article>
					{else if $RECENT_ACTIVITY->isRestore()}
						<article class="timeline-item alt">

						</article>
					{/if}
				{/foreach}
			{else}
				<div class="summaryWidgetContainer">
					<p class="textAlignCenter">{vtranslate('LBL_NO_RECENT_UPDATES')}</p>
				</div>
		{/if}
	</div>
	{if $PAGING_MODEL->isNextPageExists()}
		<div class="row-fluid">
			<div class="pull-right">
				<a href="javascript:void(0)" class="moreRecentUpdates">{vtranslate('LBL_MORE',$MODULE_NAME)}..</a>
			</div>
		</div>
	{/if}
	<span class="clearfix"></span>
</div>
</div>
</section>
{/strip}
