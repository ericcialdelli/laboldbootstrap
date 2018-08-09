package ar.com.labold.utils;

import java.util.Comparator;

import ar.com.labold.negocio.ItemMenu;

public class ComparadorItemsMenu implements Comparator<ItemMenu> {

	public int compare(ItemMenu o1, ItemMenu o2) {

		return o1.getId().compareTo(o2.getId());
	}

}
