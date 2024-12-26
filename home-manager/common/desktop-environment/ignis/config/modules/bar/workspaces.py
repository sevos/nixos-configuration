from ignis.services.hyprland import HyprlandService
from ignis.widgets import Widget

hyprland = HyprlandService.get_default()


class WorkspaceButton(Widget.Button):
    def __init__(self, workspace: dict) -> None:
        super().__init__(
            css_classes=["workspace", "unset"],
            on_click=lambda x, id=workspace["id"]: hyprland.switch_to_workspace(id),
            halign="start",
            valign="center",
            # append buildInputs in ignis derivation
            child=Widget.Label(label=str(workspace["id"])),
        )
        if workspace["id"] == hyprland.active_workspace["id"]:
            self.add_css_class("active")


def scroll_workspaces(direction: str) -> None:
    current = hyprland.active_workspace["id"]
    if direction == "up":
        target = current - 1
        hyprland.switch_to_workspace(target)
    else:
        target = current + 1
        if target == 11:
            return
        hyprland.switch_to_workspace(target)


def workspaces():
    return Widget.EventBox(
        on_scroll_up=lambda x: scroll_workspaces("up"),
        on_scroll_down=lambda x: scroll_workspaces("down"),
        css_classes=["workspaces"],
        visible=hyprland.is_available,
        child=hyprland.bind(
            "workspaces",
            transform=lambda value: [WorkspaceButton(i) for i in value],
        ),
    )
