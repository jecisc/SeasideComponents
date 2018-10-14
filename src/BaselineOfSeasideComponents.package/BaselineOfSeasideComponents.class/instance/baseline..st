baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			self mdl: spec.
			
			spec
				package: 'SeasideComponents-MDLExtensions' with: [ spec requires: #('MaterialDesignLite') ];
				package: 'SeasideComponents-Tests-MDLExtensions' with: [ spec requires: #('SeasideComponents-MDLExtensions') ].
				
			spec
				group: 'Core' with: #('SeasideComponents-MDLExtensions');
				group: 'Tests' with: #('SeasideComponents-Tests-MDLExtensions') ]