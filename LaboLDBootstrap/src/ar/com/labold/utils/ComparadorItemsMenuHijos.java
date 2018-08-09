package ar.com.labold.utils;

import java.util.Comparator;

import ar.com.labold.negocio.ItemMenu;

public class ComparadorItemsMenuHijos implements Comparator<ItemMenu> {

	@Override
	public int compare(ItemMenu arg0, ItemMenu arg1) {

		return arg0.getOrdenHijo().compareTo(arg1.getOrdenHijo());
	}

}
