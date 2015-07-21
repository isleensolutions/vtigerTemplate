<h1>
	{$UPDATE->getParent()->getDisplayValue('subject')}
<br>{$UPDATE->getParent()->getDisplayValue('validtill')}
<br>{$UPDATE->getParent()->getDisplayValue('total')}
</h1>
<div class="desk">
	<a href="{$UPDATE->getParent()->getDetailViewUrl()}" >
	<h3 style="color:{$UPDATE->getParent()->getModule()->getColor()}">{$UPDATE->getParent()->getName()}</h3>
	</a>
</div>
                    
