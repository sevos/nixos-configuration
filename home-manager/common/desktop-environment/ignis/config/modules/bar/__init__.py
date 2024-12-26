from ignis.widgets import Widget

from .battery import battery_widget
from .clock import clock
from .kb_layout import kb_layout
from .pinned_apps import pinned_apps
from .tray import tray
from .workspaces import workspaces


def bar(monitor: int) -> Widget.Window:
    return Widget.Window(
        anchor=["left", "top", "right"],
        exclusivity="exclusive",
        monitor=monitor,
        namespace=f"ignis_BAR_{monitor}",
        layer="top",
        kb_mode="none",
        child=Widget.CenterBox(
            css_classes=["bar-widget"],
            start_widget=Widget.Box(child=[workspaces()]),
            center_widget=Widget.Box(child=[]),
            end_widget=Widget.Box(child=[tray(), battery_widget(), clock(monitor)]),
        ),
        css_classes=["unset"],
    )
