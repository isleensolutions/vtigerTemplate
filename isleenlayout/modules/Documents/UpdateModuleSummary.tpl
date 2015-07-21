<h1>
	{$UPDATE->getParent()->getDisplayValue('filename')}
<br>{$UPDATE->getParent()->getDisplayValue('modifiedtime')}
</h1>
<div class="desk">
	<a href="{$UPDATE->getParent()->getDetailViewUrl()}" >
	<h3 style="color:{$UPDATE->getParent()->getModule()->getColor()}">{$UPDATE->getParent()->getName()}</h3>
	</a>
</div>
                    
