package util

import grails.converters.JSON
import ocelot.Palette
import ocelot.PaletteItem

/**
 * Created by sergi on 18/08/14.
 */
class PaletteMarshaller implements OcelotMarshaller {
	void register() {
		JSON.registerObjectMarshaller(Palette) { Palette palette ->
			[
					id          : palette.id,
					paletteItems: palette.paletteItems.collect { PaletteItem paletteItem ->
                        def pProps = paletteItem.props == null ? [] : JSON.parse(paletteItem.props.toString())
						[
								id         : paletteItem.id,
								name       : paletteItem.name,
								description: paletteItem.description,
								icon       : paletteItem.icon,
								svg        : paletteItem.svg,
								category   : [id: paletteItem.category.id, name: paletteItem.category.name],
								activated  : paletteItem.activated,
								level	   : paletteItem.level,
								bpmnElem   : paletteItem.bpmnElem,
                                props      : pProps
						]

					}
			]
		}
	}
}
